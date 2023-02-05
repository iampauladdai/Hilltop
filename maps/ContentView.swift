//
//  ContentView.swift
//  maps
//
//  Created by Paul Addai on 2/4/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        MapView()
    }
}

class MapDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.black
        renderer.lineWidth = 5.0
        return renderer
    }
}

struct MapView: UIViewRepresentable {
    let mapDelegate = MapDelegate()
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)
        map.delegate = mapDelegate
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 37.7749, longitude: -122.4194)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        let source = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let destination = CLLocationCoordinate2D(latitude: 37.7858, longitude: -122.4064)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        
        let directions = MKDirections(request: request)

        directions.calculate { (response, error) in
                    guard let response = response else { return }
                    for route in response.routes {
                        uiView.addOverlay(route.polyline)
                        uiView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                        let eta = route.expectedTravelTime
                        print("ETA: \(eta) seconds")
                    }
                }
        
        
    }

}
