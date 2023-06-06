//
//  TabsView.swift
//  maps
//
//  Created by Paul Addai on 4/23/23.
//

import SwiftUI

struct TabsView: View {
    @State private var selectedTabIndex = 0

    
    var body: some View {
        TabView (selection: $selectedTabIndex) {
            MenuVIew(tabNumber: $selectedTabIndex)
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(0)
            
            EventsView(categorytype: .constant(String()))
                .tabItem {
                    Label("Explore", systemImage: "network")
                }.tag(1)
            Text("Saved Events")
                .tabItem {
                    Label("Offers", systemImage: "star.fill")
                }
        }.frame(width: UIScreen.main.bounds.width)
    }
}




struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
