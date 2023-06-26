////
////  MapTestView.swift
////  maps
////
////  Created by Paul Addai on 3/5/23.
////
//
import SwiftUI
import CoreLocation
//
//
struct MapTestView: View {
    let destination = CLLocationCoordinate2D(latitude: 37.331820, longitude: -122.031180)
    @Binding var companyCordinate: CLLocationCoordinate2D
    @State private var showItemView = false


    var body: some View {
        ZStack {
            DirectionView(destination: companyCordinate)
                Button {
                    //action
                    self.showItemView = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                            .frame(width: 50, height: 50)
                        Image(systemName: "arrow.left").font(.system(size: 20.0,weight: .bold)).foregroundColor(.white)
                    }
                }.offset(x: -150, y: -350)
            
            if $showItemView.wrappedValue{
                withAnimation{
                    MenuVIew(tabNumber: .constant(Int()))
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
        }.ignoresSafeArea()

    }
}


struct MapTestView_Previews: PreviewProvider {
    static var previews: some View {
        MapTestView(companyCordinate: .constant(CLLocationCoordinate2D()))
    }
}
