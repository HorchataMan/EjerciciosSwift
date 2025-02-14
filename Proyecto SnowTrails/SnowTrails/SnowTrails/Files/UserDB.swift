//
//  UserDB.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//

struct UsersDB {
    
    let dummyUser = User(name: "William", email: "cholodark69@hotmail.com", password: "Megustaelchile", isAdmin: false)

    var users: [String: User] = [
        "adminuser@keepcoding.es": User(name: "Adminuserkeepcoding1", email: "adminuser@keepcoding.es", password: "Adminuser1", isAdmin: true),
        "regularuser@keepcoding.es": User(name: "Regularuserkeepcoding1", email: "regularuser@keepcoding.es", password: "Regularuser1", isAdmin: false)
    ]
    
    mutating func addRegularUser(email: String, name: String, password: String) {
        let userToAdd = User(name: name, email: email, password: password, isAdmin: false)
        users[email] = userToAdd
    }
}
