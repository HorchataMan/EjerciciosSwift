//
//  GeoPoints.swift
//  SnowTrails
//
//  Created by Jan Petrina on 14/02/2025.
//
import math_h

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
    
    // Se hace hashable para poder usarlo en diccionarios (quien sabe que tan util sea poder usar el punto asi pero lo descubrire, hay fé)
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
    
    func findHaversineDistance(to other: GeoPoint) -> Double {
        let earthRadius = 6371.0 // medido en Km
        let toRadians = Double.pi / 180

        // Se convierte la latitutd y longitud a radianes
        let lat1 = latitude * toRadians
        let lon1 = longitude * toRadians
        let lat2 = other.latitude * toRadians
        let lon2 = other.longitude * toRadians

        // Se calcula la distancia
        let dLat: Double = lat2 - lat1
        let dLon: Double = lon2 - lon1
        let a = sin(dLat / 2) * sin(dLat / 2) + cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))
        let distance = earthRadius * c

        return distance
            
    }
    
    func findCartesianDistance(to other: GeoPoint) -> Double {
        //Consigue la equivalencia en Km de las coordenadas
        let toRadians = Double.pi / 180
        
        //La cantidad de Km que hay por grado de latitud y longitud
        let latToKm: Double = 111.19
        let lonToKm1: Double = 111.19 * cos(latitude * toRadians)
        let lonToKm2: Double = 111.19 * cos(other.latitude * toRadians)
        
        let lat1 = latitude  * latToKm
        let lon1 = longitude * lonToKm1
        
        let lat2 = other.latitude * latToKm
        let lon2 = other.longitude * lonToKm2
        
        
        //Se calcula la distancia con teorema de pitagoras ez pz lemon squeezy (no es tan exacta)
        let dLat: Double = lat2 - lat1
        let dLon: Double = lon2 - lon1
        let dElevation: Double = (other.elevation - elevation) / 1000.0 //Se convierte de metros a Km
        
        let flatDistance: Double = sqrt((dLat * dLat) + (dLon * dLon))
        
        let elevatedDistance: Double = sqrt((flatDistance * flatDistance) + (dElevation * dElevation))
        
        return elevatedDistance
        
    }
}
