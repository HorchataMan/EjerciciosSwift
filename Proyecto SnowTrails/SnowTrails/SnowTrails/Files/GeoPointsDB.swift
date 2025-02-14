//
//  GeoPointsDB.swift
//  SnowTrails
//
//  Created by Jan Petrina on 14/02/2025.
//


let alpinaGrande = GeoPoint(name: "Alpina Grande", latitude: 46.0000, longitude: 7.5000, elevation: 1500.0)
let alpinaPequena = GeoPoint(name: "Alpina Pequeña", latitude: 46.0022, longitude: 7.5200, elevation: 1200.0)
let picoNevado = GeoPoint(name: "Pico Nevado", latitude: 46.1000, longitude: 7.6000, elevation: 1600.0)
let valleBlanco = GeoPoint(name: "Valle Blanco", latitude: 45.9000, longitude: 7.4000, elevation: 1400.0)
let cumbreAzul = GeoPoint(name: "Cumbre Azul", latitude: 46.0500, longitude: 7.5500, elevation: 1550.0)
let lagoHelado = GeoPoint(name: "Lago Helado", latitude: 46.2000, longitude: 7.7000, elevation: 1700.0)
let bosqueNevado = GeoPoint(name: "Bosque Nevado", latitude: 46.3000, longitude: 7.8000, elevation: 1800.0)
let cerroPlateado = GeoPoint(name: "Cerro Plateado", latitude: 46.1500, longitude: 7.6500, elevation: 1650.0)
let cascadaBlanca = GeoPoint(name: "Cascada Blanca", latitude: 46.2500, longitude: 7.7500, elevation: 1750.0)
let refugioAlpino = GeoPoint(name: "Refugio Alpino", latitude: 46.0500, longitude: 7.4500, elevation: 1450.0)
let refugioAislado = GeoPoint(name: "Refugio Aislado", latitude: 46.0000, longitude: 7.4000, elevation: 1400.0)

let connections: [GeoPoint: [GeoPoint]] = [
    alpinaGrande: [picoNevado, valleBlanco, cumbreAzul, alpinaPequena],
    alpinaPequena: [alpinaGrande],
    picoNevado: [alpinaGrande, lagoHelado, cerroPlateado],
    valleBlanco: [alpinaGrande, refugioAlpino],
    cumbreAzul: [alpinaGrande, cerroPlateado],
    lagoHelado: [picoNevado, bosqueNevado],
    bosqueNevado: [lagoHelado, cascadaBlanca, cerroPlateado],
    cerroPlateado: [picoNevado, cumbreAzul, bosqueNevado, cascadaBlanca],
    cascadaBlanca: [cerroPlateado, bosqueNevado],
    refugioAlpino: [valleBlanco],
    refugioAislado: []
]



