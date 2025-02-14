//
//  RegularMenu.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//

class RegularUserMenu: Menu {
    let signedInUser: User?
    
    init(signedInUser: User?) {
        self.signedInUser = signedInUser
    }
    
    func runMenu(){
        print("Welcome to the menu!\n")
    }
}
