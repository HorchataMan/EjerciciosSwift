//
//  SnowTrailsTests.swift
//  SnowTrailsTests
//
//  Created by Jan Petrina on 06/02/2025.
//

import Testing

struct SnowTrailsTests {

    @Test func cartesianVsHaversineDistance() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let point1 = GeoPointsDatabase().alpinaGrande
        let point2 = GeoPointsDatabase().picoNevado
        let point3 = GeoPointsDatabase().lagoHelado
        
        let distance12 = point1.findHaversineDistance(to: point2)
        let distance23 = point2.findHaversineDistance(to: point3)
        
        let distanceAB = point1.findCartesianDistance(to: point2)
        let distanceBC = point2.findCartesianDistance(to: point3)
        
        let distance = distance12 + distance23
        let distance2 = distanceAB + distanceBC
        
        print(distance)
        print(distance12)
        print(distance23)
        
        print("=======")
        
        print(distanceAB)
        print(distanceBC)
        print(distance2)
        
        print("==========")
        
        let routeDistance1 = RegularUserMenu(signedInUser: UsersDB().dummyUser).findRouteDistance(GeoPointsDatabase().routes["Ruta del Pico Nevado y Lago Helado"] ?? [GeoPointsDatabase().alpinaGrande, GeoPointsDatabase().picoNevado, GeoPointsDatabase().lagoHelado])
        
        
        #expect(distance == routeDistance1)
        
    }

}
