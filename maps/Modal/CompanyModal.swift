//
//  CompanyModal.swift
//  maps
//
//  Created by Paul Addai on 3/5/23.
//

import Foundation
import CoreLocation


struct CompanyModel: Codable, Identifiable {
  var id: String
  var name: String
  var cordinate: String
  var category: String
  
  // Computed Property
  var location: CLLocationCoordinate2D {
    let cordinates = cordinate.components(separatedBy: ", ")
    let latitude = Double(cordinates[1])!
    let longitude =  Double(cordinates[0])!
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
