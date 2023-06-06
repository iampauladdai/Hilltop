import SwiftUI
import MapKit
import CoreLocation

struct DirectionView: UIViewRepresentable {
    
    @State private var directions: [MKRoute.Step] = []
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.0312186),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    let destination: CLLocationCoordinate2D
    
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: locationManager.location!.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            guard let response = response else { return }
            self.directions = response.routes[0].steps
            let sourceCoordinate = request.source!.placemark.coordinate
            let destinationCoordinate = request.destination!.placemark.coordinate
            let sourceAnnotation = MKPointAnnotation()
            sourceAnnotation.coordinate = sourceCoordinate
            sourceAnnotation.title = "You Are Here"
            let destinationAnnotation = MKPointAnnotation()
            destinationAnnotation.coordinate = destinationCoordinate
            destinationAnnotation.title = "Destination"
            view.addAnnotations([sourceAnnotation, destinationAnnotation])
            view.addOverlay(response.routes[0].polyline)
            self.region = MKCoordinateRegion(
                center: CLLocationCoordinate2DMake((sourceCoordinate.latitude + destinationCoordinate.latitude)/2, (sourceCoordinate.longitude + destinationCoordinate.longitude)/2),
                span: MKCoordinateSpan(latitudeDelta: abs(sourceCoordinate.latitude - destinationCoordinate.latitude)*1.3, longitudeDelta: abs(sourceCoordinate.longitude - destinationCoordinate.longitude)*1.3))
            view.setRegion(self.region, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: DirectionView
        
        init(_ parent: DirectionView) {
            self.parent = parent
            super.init()
            
            parent.locationManager.requestWhenInUseAuthorization()
            parent.locationManager.delegate = self
            parent.locationManager.startUpdatingLocation()
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .yellow
            renderer.lineWidth = 5
            return renderer
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            parent.region.center = location.coordinate
        }
    }
}
