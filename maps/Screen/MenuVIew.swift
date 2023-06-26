//
//  HomeView.swift
//  Demeter
//
//  Created by Paul Addai on 3/10/22.
//

import SwiftUI
import CoreLocation

struct MenuVIew: View {
    
    @Binding var tabNumber: Int
    @State  var searchField: String = String()
    @State  var welcomeText: String = "Events in the \n Quad Cities"
    @State  var showPopUp = false
    @State  var cartSize: Int = 0
    @State  var showCartView = false
    @State  var showAdditemView = false
    @State  var showScanView = false
    @State  var showItemView = false
    @State  var showEventsView = false
    @State  var showMapView = false
    @State  var category  = "Other"
    @State  var location = CLLocationCoordinate2D(latitude: 41.49786, longitude: -90.55701)

    
    
    
    var categoriesList = ["McDonalds 20% off","Subway \n 10% off", "Taco Bell \n 10% off", "Artsy Bookworm \n 10% off"]
    
    
    var itemsList = ["groce": ["Grocery"],"fastf": ["Fast foods"],"phar": ["Pharmacy"],"auto": ["Autoshops"],"bar": ["Bar"],"res": ["Restaurant"]]
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    
    var body: some View {
        
        
        ZStack{
            Color(#colorLiteral(red: 0.8666666746139526, green: 0.7280000448226929, blue: 0, alpha: 1))
            
            //Ellipse 1
            Ellipse()
                .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                .frame(width: 51, height: 49).offset(x:-170,y:-420)
            
            //Ellipse 2
            Ellipse()
                .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                .frame(width: 228, height: 219)
                .offset(x:170,y:-420)
            
            //Ellipse 3
            Ellipse()
                .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                .frame(width: 51, height: 49).offset(x:200,y:130)
            
            //Ellipse 4
            Ellipse()
                .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                .frame(width: 228, height: 219)
                .offset(x:-190,y:450)
            
            //Ellipse 5
            Ellipse()
                .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                .frame(width: 228, height: 219)
                .offset(x:0,y:-50)
            
            
            
            VStack{
                Spacer()
                
                VStack{
                    Image("logo_green").resizable().frame(width: 30, height: 30, alignment: .center).padding(.top,15)
                    
                    HStack{
                        HStack{
                            Spacer()
                            Text("THE HILLTOP").font(.system(size: 20, weight: .bold)).offset(x: 20,y: -30)
                            Spacer()
                        }.padding(.leading,8)
                        Spacer()
                        
                        Button {
                        } label: {
                            Image("user").resizable().frame(width: 50, height: 50, alignment: .center)
                        }
                        
                    }.padding()
                    
                }
                
                ZStack{
                    TextField("Search Hilltop Businesses", text: $searchField)
                        .font(.system(size: 15, weight: .semibold))
                        .padding().multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color(#colorLiteral(red: 0.16470588743686676, green: 0.615686297416687, blue: 0.5607843399047852, alpha: 1)), style: StrokeStyle(lineWidth: 3.0)))
                        .padding()
                    
                    
                    
                    Image(systemName: "magnifyingglass").font(.system(size: 20.0,weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.16470588743686676, green: 0.615686297416687, blue: 0.5607843399047852, alpha: 1))).offset(x: -130, y: 0)
                    
                    Button {                        
                        
                    } label: {
                        Image(systemName: "text.justify").font(.system(size: 20.0,weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.16470588743686676, green: 0.615686297416687, blue: 0.5607843399047852, alpha: 1)))
                    }.offset(x: 130, y: 0)
                    
                }.frame(width: 380, height: 50, alignment: .center)
                
                Spacer().frame(width: 0, height: 20, alignment: .center)
                
                ZStack {
                    
                    VStack{
                        Button {
                            
                            if let url = URL(string: "https://visitquadcities.com/events/events-calendar") {
                                UIApplication.shared.open(url)
                            }
                            
                        } label: {
                            
                            ZStack{
                                Image("quad")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 342, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)))
                                
                                Text(welcomeText).font(.system(size: 20, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            }
                            
                            
                        }
                        
                        Button {
                            self.showEventsView = true
                            self.tabNumber = 1
                        }
                        
                    label: {
                        
                        ZStack{
                            Image("augie")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 342, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)))
                            
                            Text("Events on Campus").font(.system(size: 20, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        }
                        
                        
                    }
                        
                    }
                    
                }
                .frame(width: 342, height: 131)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0 ..< self.categoriesList.count) { item in
                            GeometryReader { geometry in
                                
                                Button {
                                    if self.categoriesList[item] == "Artsy Bookworm \n 10% off" {
                                        self.showMapView = true
                                    }
                                    
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(#colorLiteral(red: 0.95686274766922, green: 0.6352941393852234, blue: 0.3803921639919281, alpha: 1)))
                                            .frame(width: 120, height: 45)
                                        
                                        Text(self.categoriesList[item]).font(.system(size: 15, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    }
                                }
                                
                            }
                            .frame(width: 130, height: 40)
                        }
                    }
                    .padding()
                }
                
                
                
                
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(Array(itemsList.keys), id: \.self) { item in
                            ZStack {
                                Button {
                                    self.category = itemsList[item]![0]
                                    self.showItemView = true
                                } label: {
                                    ZStack {
                                        Image(item)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 157, height: 218)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.70000001192092896)))
                                        
                                        HStack{
                                            
                                            //Name
                                            Text(itemsList[item]![0]).font(.system(size: 25, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        }
                                    }
                                    
                                }
                                .frame(width: 157, height: 218)
                                
                                
                                
                                Button {
                                    //action
                                } label: {
                                    Image(systemName: "heart").font(.system(size: 30.0,weight: .bold)).foregroundColor(.white)
                                    
                                }.offset(x:55,y:-80)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                Spacer()
                
            }
            
            if $showItemView.wrappedValue{
                withAnimation{
                    CompanyListView(categorytype: self.$category)
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
            
            if $showEventsView.wrappedValue{
                withAnimation{
                    EventsView(categorytype: .constant(String()))
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
            
            if $showMapView.wrappedValue{
                withAnimation{
                    MapTestView(companyCordinate: self.$location)
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
            
            
            
        }.ignoresSafeArea(.all)
    }
}



struct MenuVIew_Previews: PreviewProvider {
    static var previews: some View {
        MenuVIew(tabNumber: .constant(Int()))
    }
}
