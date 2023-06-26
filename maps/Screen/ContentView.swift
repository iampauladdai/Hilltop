//
//  ContentView.swift
//  maps
//
//  Created by Paul Addai on 2/4/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showMapLocations = false
    
    var body: some View {
        ZStack{
            
            SplashScreen().onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showMapLocations = true
                    
                }
            }
            
            
            if $showMapLocations.wrappedValue{
                withAnimation{
                   TabsView()
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
