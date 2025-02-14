//
//  AdminMenu.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//

class AdminMenu: Menu {
    var signedInUser: User?
    
    
    enum AdminOptions: Int {
        case seeAllUsers = 1
        case addUser = 2
        case deleteUser = 3
        case addRoutePoint = 4
        case logOut = 5
        case invalid = 6
    }
    
    init(signedInUser: User?) {
        self.signedInUser = signedInUser
    }
    
    func runMenu(){
        var option: AdminOptions
        
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
            Admin Menu:
            1 - Print all users
            2 - Add User
            3 - Delete User
            4 - Add Route Point
            5 - Log-Out
            
            """)
    }
    
    func chooseOption(input: Int) -> AdminOptions {
        var option: AdminOptions
        
        if input < 1 && input > 6 {
            option = AdminOptions.invalid
        } else {
            option = AdminOptions(rawValue: input) ?? AdminOptions.invalid
        }
        
        return option
    }
    
    func evaluateOption(option: AdminOptions) {
        switch option {
        case .seeAllUsers:
            printAllUsers()
            runMenu()
        case .addUser:
            addUser()
            runMenu()
        case .deleteUser:
            deleteUser(onSuccess: {}, onFailure: {})
            runMenu()
        case .addRoutePoint:
            print("This feature is not implemented yet")
            runMenu()
        case .logOut:
            logOut()
        case .invalid:
            print("That's not a valid choice")
            runMenu()
        }
    }
    
    func printAllUsers(){
        for registeredUser in userDatabase.users {
            print("- \(registeredUser.value.isAdmin ? "Admin:": "Regular User:") \(registeredUser.value.name) --- Email: \(registeredUser.value.email)")
        }
        print("===============\n")
    }
    
    func addUser() {
        let emailToAdd = registerEmail(onFailure: runMenu)
        print("\nEmail: \(emailToAdd)")
        let nameToAdd = registerName(onFailure: runMenu)
        print("\nName: \(nameToAdd)")
        let passwordToAdd = registerPassword(onFailure: runMenu)
        
        userDatabase.addRegularUser(email: emailToAdd, name: nameToAdd, password: passwordToAdd)
        print("\nRegisterd user: \(nameToAdd) (\(emailToAdd)")
    }
    
    func registerEmail(onFailure: () -> Void) -> String {
        var email: String = "cholodark69@hotmail.com"
        print("\nInput an e-mail address:")
        do {
            email = try handleUserInput()
            if try validateEmail(email: email) {
                return email
            }
            else {
                onFailure()
            }
        } catch AccountErrors.usedEmail{
            print("\nThat e-mail is already in use\n")
            onFailure()
        } catch {
            print("Invalid input")
            onFailure()
        }
        
        return email
    }
    
    func validateEmail(email: String) throws -> Bool {
        var isValid = false
        
        if userDatabase.users.keys.contains(email) {
            isValid = false
            throw AccountErrors.usedEmail
        } else {
            isValid = true
        }
        return isValid
    }
    
    func registerPassword(onFailure: () -> Void) -> String {
        var password: String = ""
        print("\nInput a password:")
        do {
            password = try handleUserInput()
            if validatePassword(password: password) {
                return password
            }
            else {
                onFailure()
            }
        } catch AccountErrors.shortPassword{
            print("\nPassword must be at least 8 characters long\n")
            onFailure()
        } catch {
            print("Invalid input")
            onFailure()
        }
        
        return password
    }
    
    func validatePassword(password: String) -> Bool {
        //Luego hago que si cheque cosas, por ahora solo para tener la funcion
        let isValid = true
        return isValid
    }
    
    func registerName(onFailure: () -> Void) -> String {
        var name: String = ""
        print("\nInput the name:")
        do {
            name = try handleUserInput()
            
            return name
            
            
            
        } catch {
            print("Invalid input")
            onFailure()
        }
        
        return name
    }
    
    func checkUserToDelete(userEmail: String) throws {
        guard let userCheck = userDatabase.users[userEmail] else {
            //print("No user with that email exists")
            throw AccountErrors.nonExistentUser
        }
        
        userDatabase.users[userEmail] = nil
        print("User \(userCheck.name) with e-mail: \(userCheck.email) removed successfully")
    }
    
    func deleteUser(onSuccess: () -> Void, onFailure: () -> Void){
        do {
            print("\nEnter the e-mail of the user you wish to remove:\n")
            let input = try handleUserInput()
            
            try checkUserToDelete(userEmail: input)
            
            onSuccess()
            
        } catch AccountErrors.nonExistentUser {
            print("\nNo user with that e-mail exists")
            onFailure()
        } catch {
            print("Invalid input")
            onFailure()
        }
    }
    
    func logOut() {
        self.signedInUser = nil
        print("\nLogged Out, returning to login screen\n")
        LoginPage().runLoginMenu()
    }
}
