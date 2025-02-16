//
//  RegularMenu.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//
import math_h


class RegularUserMenu: Menu {
    var signedInUser: User?
    
    init(signedInUser: User?) {
        self.signedInUser = signedInUser
    }
    
    enum RegularUserOptions: Int {
        case seeRoutes = 1
        case findShortestRoute = 2
        case logOut = 3
        case invalid = 4
    }
    
    func runMenu(){
        var option: RegularUserOptions
        
        repeat {
            showOptions()
            do {
                option = chooseOption(input: try takeNumericInput())
                evaluateOption(option: option)
            } catch InputErrors.nonNumericInput {
                print("That's not a valid option\n")
                option = .invalid
            } catch {
                print("Unknown error\n")
                option = .invalid
            }
        } while option == .invalid
    }
    
    func showOptions(){
        print("""
            Regular User Menu:
            
            1 - Print all routes
            2 - Find the shortest route between two points
            3 - Log-Out
            
            """)
    }
    
    func chooseOption(input: Int) -> RegularUserOptions {
        var option: RegularUserOptions
        
        if input < 1 && input > 3 {
            option = RegularUserOptions.invalid
        } else {
            option = RegularUserOptions(rawValue: input) ?? RegularUserOptions.invalid
        }
        
        return option
    }
    
    func evaluateOption(option: RegularUserOptions) {
        switch option {
        case .seeRoutes:
            seeRoutesAndDistances()
            runMenu()
        case .findShortestRoute:
            print("This feature is not yet implemented")
            runMenu()
        case .logOut:
            logOut()
        case .invalid:
            print("That's not a valid choice")
            runMenu()
        }
    }
    
    func seeRoutesAndDistances() {
        let routes = GeoPointsDatabase().routes
        
        for route in routes {
            print("Route: \(route.key) - Distancia: \(round(findRouteDistance(route.value) * 100.0) / 100.0) Km")
        }
        
        
    }
    
    func findRouteDistance(_ route:[GeoPoint]) -> Double{
        var distance: Double = 0.0
        
        for (index, geoPoint) in route.dropLast().enumerated() {
            distance += geoPoint.findHaversineDistance(to: route[index + 1])
        }
        
        return distance
    }
    
    func logOut() {
        self.signedInUser = nil
        print("\nLogged Out, returning to login screen\n")
        LoginPage().runLoginMenu()
    }
}
