//
//  MapScreenView.swift
//  maps
//
//  Created by Paul Addai on 2/14/23.
//

import SwiftUI
import MapKit



struct MapScreenView: View {
    @State private var searchField: String = String()
    @State private var mapType: MKMapType = .standard
    @State private var searchColor: Color = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    
    @State private var magColor: Color = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    
    
    @State var source =  CLLocationCoordinate2D()
    @State var destination =  CLLocationCoordinate2D()

    var body: some View {
        
        ZStack{
            MapView(mapType: mapType, source: source,destination: destination).cornerRadius(20)
            ZStack{
                TextField("Destination", text: $searchField).onSubmit {
                    self.source = CLLocationCoordinate2D(latitude: 41.503065632109184, longitude: -90.55144540983939)
                    self.destination = CLLocationCoordinate2D(latitude: 41.4919, longitude: -90.5593)
                }
                    .font(.system(size: 15, weight: .semibold))
                    .padding().multilineTextAlignment(.center)
                    .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(searchColor, style: StrokeStyle(lineWidth: 3.0)))
                    .padding()
                
                Image(systemName: "magnifyingglass").font(.system(size: 20.0,weight: .bold)).foregroundColor(magColor).offset(x: -130, y: 0)
                
                
            }.offset(y: -320)
            
            Picker("", selection: $mapType) {
                Text("Standard").tag(MKMapType.standard)
                Text("Hybrid").tag(MKMapType.hybrid)
                Text("satellite").tag(MKMapType.satellite)
            }.onChange(of: mapType) { _ in
                if self.mapType == MKMapType.hybrid || self.mapType == MKMapType.satellite  {
                    self.searchColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                    self.magColor = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                }
                
                if self.mapType == MKMapType.standard {
                    self.searchColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                    self.magColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                }
            }
            .pickerStyle(.segmented)
            .background(.thickMaterial).offset(y: 350)
            
            
        }.ignoresSafeArea()
    }
    
    
    
    
    class MapDelegate: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.orange
            renderer.lineWidth = 6.0
            return renderer
        }
    }
    
    struct MapView: UIViewRepresentable {
        let mapDelegate = MapDelegate()
        let map = MKMapView(frame: .zero)
        var mapType: MKMapType
        let source: CLLocationCoordinate2D
        let destination: CLLocationCoordinate2D

        func makeUIView(context: Context) -> MKMapView {
            map.isPitchEnabled = true
            map.showsUserLocation = true
            map.delegate = mapDelegate
            let coordinate = source
            map.setCenter(coordinate, animated: true)

            return map
        }
        
        
        func updateUIView(_ uiView: MKMapView, context: Context) {
                
           if source.latitude != nil {
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
                
                let directions = MKDirections(request: request)
            
            
                
                directions.calculate { (response, error) in
                    guard let response = response else { return }
                    uiView.removeOverlays(uiView.overlays)

                    for route in response.routes {
                        uiView.addOverlay(route.polyline)
                        uiView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                        let eta = route.expectedTravelTime
                        print("ETA: \(eta) seconds")

                    }
                }
            }
            
            uiView.mapType = mapType
            uiView.delegate = mapDelegate

        }
        
    }
}

struct MapScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MapScreenView()
    }
}
