//
//  GeoPoints.swift
//  SnowTrails
//
//  Created by Jan Petrina on 14/02/2025.
//

struct GeoPoint: Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    let elevation: Double
    
    init(name: String, latitude: Double, longitude: Double, elevation: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.elevation = elevation
    }
    
    // Se hace hashable para poder usarlo en disccionarios
       func hash(into hasher: inout Hasher) {
           hasher.combine(name)
           hasher.combine(latitude)
           hasher.combine(longitude)
           hasher.combine(elevation)
       }

       
       static func == (lhs: GeoPoint, rhs: GeoPoint) -> Bool {
           return lhs.name == rhs.name &&
                  lhs.latitude == rhs.latitude &&
                  lhs.longitude == rhs.longitude &&
                  lhs.elevation == rhs.elevation
       }
}
