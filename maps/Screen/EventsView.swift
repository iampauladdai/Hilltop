//
//  CompanyListView.swift
//  maps
//
//  Created by Paul Addai on 3/5/23.
//


//  HomeView.swift
//  Demeter
//
//  Created by Paul Addai on 3/10/22.
//

import SwiftUI
import CoreLocation

struct EventsView: View {
    
    
    @Binding var categorytype: String
    
    @State  var searchField: String = String()
    @State  var welcomeText: String = "Events in the \n Quad Cities"
    @State  var showPopUp = false
    @State  var cartSize: Int = 0
    
    @State  var showCartView = false
    @State  var showAdditemView = false
    @State  var showScanView = false
    @State  var showItemView = false
    @State  var cordinates  = CLLocationCoordinate2D()
    @State private var filteredItems = [CompanyModel]()

    
    @State  var showMenuView = false

    
    
    
    
    let companies: [CompanyModel] = Bundle.main.decode("campusEvents.json")
    
    
    var cate = "Grocery"
    
    //This is not a database..lol
    var categoriesList = ["Club \n meetings","Campus \n Events", "Atheletic \n Events"] //Discounts
     
    //["All", "Groceries", "Pharmacy", "Bars", "Banks","Fitness", "Barbers", "Fast foods", "Hardware Stores", "Agencies", "Health", "Parks","Autoshops", "Gas Stations", "Restaurants", "Books", "Antique Stores", "Beverage & Smoke Shops", "Others"]

    
    
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
                VStack{
                    
                    VStack{
                        Spacer().frame(height: 100)
                        HStack{
                            Spacer()
                            Text("THE HILLTOP").font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
                    }.padding()
                    
                }.offset(y: -20)
                
                ZStack{
                    Button {
                        self.showMenuView = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 0, green: 0.1866666078567505, blue: 0.46666666865348816, alpha: 1)))
                                .frame(width: 50, height: 50)
                            Image(systemName: "arrow.left").font(.system(size: 20.0,weight: .bold)).foregroundColor(.white)
                        }
                    }.offset(x: -150, y: -90)
                    
                    TextField("Search Campus Events", text: $searchField)
                        .font(.system(size: 15, weight: .semibold))
                        .padding().multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color(#colorLiteral(red: 0.16470588743686676, green: 0.615686297416687, blue: 0.5607843399047852, alpha: 1)), style: StrokeStyle(lineWidth: 3.0)))
                        .padding()
                    
              
                
                    
                    
                    Image(systemName: "magnifyingglass").font(.system(size: 20.0,weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.16470588743686676, green: 0.615686297416687, blue: 0.5607843399047852, alpha: 1))).offset(x: -130, y: 0)
                    
                    Button {
                        //action
                    } label: {
                        Image(systemName: "text.justify").font(.system(size: 20.0,weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.16470588743686676, green: 0.615686297416687, blue: 0.5607843399047852, alpha: 1)))
                    }.offset(x: 130, y: 0)
                    
                }.frame(width: 380, height: 50, alignment: .center)
                
                
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0 ..< self.categoriesList.count) { item in
                            GeometryReader { geometry in
                                
                                Button {
                                    
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
                        ForEach(companies) { item in
                            
                       
                            ZStack {
                                Button {
                                    self.cordinates = item.location
                                    self.showItemView = true
                                    print(categorytype + " " + item.category)
                                } label: {
                                    ZStack {
                                        Image("comingsoon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 157, height: 218)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.80000001192092896)))
                                        
                                        HStack{
                                            
                                            Text(item.name).font(.system(size: 20, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            
                                        }
                                    }
                                    
                                }
                                .frame(width: 157, height: 218)
                                
                                                                
                                Button {
                                    //action
                                } label: {
                                    Image(systemName: "heart").font(.system(size: 30.0,weight: .bold)).foregroundColor(.white)
                                    
                                }.offset(x:55,y:-80)
                                
                                // }
                            }
                            .padding(.horizontal)
                        
                            }

                            Spacer()
                                    
                        }
                    }
                }
                
            if $showItemView.wrappedValue{
                withAnimation{
                    MapTestView(companyCordinate: self.$cordinates)
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
            
            if $showMenuView.wrappedValue{
                withAnimation{
                  MenuVIew(tabNumber: .constant(Int()))
                }.transition(AnyTransition.move(edge: .trailing).combined(with: .opacity)).animation(Animation.easeInOut(duration: 0.5))
            }
            }.ignoresSafeArea(.all)
        
        }
    }

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(categorytype: .constant(String()))
    }
}




//TODO: Create a single event view for all types of events
// *change small buttons
// presentation
//
