//
//  Users.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//

struct User {
    var name: String
    var email: String
    var password: String
    var isAdmin: Bool
    
    init(name: String, email: String, password: String, isAdmin: Bool) {
        self.name = name
        self.email = email
        self.password = password
        self.isAdmin = isAdmin
    }
}
