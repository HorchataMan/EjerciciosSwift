//
//  AdminMenu.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//

class AdminMenu: Menu {
    let signedInUser: User
    
    enum AdminOptions: Int {
        case seeAllUsers = 1
        case addUser = 2
        case deleteUser = 3
        case addRoutePoint = 4
        case logOut = 5
        case invalid = 6
    }
    
    init(signedInUser: User) {
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
            print()
        case .addRoutePoint:
            print()
        case .logOut:
            print()
        case .invalid:
            print()
        }
    }
    
    func printAllUsers(){
        for registeredUser in UsersDB().users {
            print("- \(registeredUser.value.isAdmin ? "Admin:": "Regular User:") \(registeredUser.value.name) --- Email: \(registeredUser.value.email)")
        }
        print("===============\n")
    }
    
    func addUser() {
        let emailToAdd = registerEmail(onFailure: runMenu)
        print("Added email: \(emailToAdd)")
    }
    
    func registerEmail(onFailure: () -> Void) -> String {
        var email: String = "cholodark69@hotmail.com"
        print("\nIntroduce el correo que deseas registrar")
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
        
        if UsersDB().users.keys.contains(email) {
            isValid = false
            throw AccountErrors.usedEmail
        } else {
            isValid = true
        }
        return isValid
    }
}
