//
//  SplashScreen.swift
//  maps
//
//  Created by Paul Addai on 2/12/23.
//

import SwiftUI

struct SplashScreen: View {

    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).ignoresSafeArea()
            
            
            VStack{
                //ConnectMe
                Text("ConnectMe").font(.system(size: 32, weight: .semibold, design: .rounded)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
        }
        
      
        
    }
}



//struct PolylineAnimator: AnimatableModifier {
//    @Binding var polyline: MKPolyline
//    var animationProgress: Double
//
//    func body(content: Content) -> some View {
//        MapView(polyline: $polyline)
//            .overlay(PolylineShape(polyline: $polyline)
//            .stroke(Color.blue, lineWidth: 2)
//            .opacity(Double(animationProgress))
//            .animation(.linear))
//    }
//}



//extension View {
//    func animatePolyline(polyline: Binding<MKPolyline>) -> some View {
//        return self.modifier(PolylineAnimator(polyline: polyline, animationProgress: 1))
//    }
//}

//struct PolylineShape: Shape {
//    @Binding var polyline: MKPolyline
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let firstCoordinate = polyline.value.coordinates[0]
//
//        let firstPoint = rect.origin.applying(
//            CGAffineTransform(scaleX: rect.width, y: rect.height)
//                .translatedBy(x: firstCoordinate.longitude, y: firstCoordinate.latitude)
//        )
//        path.move(to: firstPoint)
//
//        for i in 1..<polyline.pointCount {
//            let coordinate = polyline.points()[i].coordinate
//            let point = rect.origin.applying(
//                CGAffineTransform(scaleX: rect.width, y: rect.height)
//                    .translatedBy(x: coordinate.longitude, y: coordinate.latitude)
//            )
//            path.addLine(to: point)
//        }
//
//        return path
//    }
//}





struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
