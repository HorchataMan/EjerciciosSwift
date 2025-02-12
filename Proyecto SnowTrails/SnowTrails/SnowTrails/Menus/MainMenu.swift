//
//  MainMenu.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//
import Foundation


class Menu {
    
    func handleUserInput() throws -> String {
        guard let input = readLine() else {
            throw InputErrors.invalidInput
        }
        
        return input
    }
    
    func takeNumericInput() throws -> Int {
        var numericInput: Int = 0
        do {
            let input = try handleUserInput()
            
            if Int(input) != nil {
                numericInput = Int(input)!
            } else {
                throw InputErrors.nonNumericInput
            }
            
        } catch InputErrors.invalidInput {
            print("Invalid Input")
        }
        return numericInput
    }
    
}

class LoginPage: Menu {
    
    enum LoginOptions: String {
        case login = "Log-In"
        case exit = "Exit"
        case invalid = "Invalid"
    }
    
    func showOptions() {
        print("""
        
        Welcome to SnowTrails!
        
        1 - \(LoginOptions.login.rawValue)
        2 - \(LoginOptions.exit.rawValue)
        ========================
        """)
    }
    
    func chooseOption(option: Int) -> LoginOptions {
        switch option {
        case 1:
            return LoginOptions.login
        case 2:
            return LoginOptions.exit
        default:
            return LoginOptions.invalid
        }
    }
    
    func evaluateOption(option: LoginOptions) {
        switch option {
        case .login:
            requestEmail(onSuccess: {}, onFailure: runLoginMenu)
        case .exit:
            exit(0)
        case .invalid:
            print("That's not a valid option\n")
        }
    }
    
    func runLoginMenu() {
        var option: LoginOptions
        
        repeat {
            showOptions()
            do {
                option = chooseOption(option: try takeNumericInput())
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
    
    func requestEmail(onSuccess: () -> Void, onFailure: () -> Void) {
        do {
            print("Enter your e-mail: ")
            let input = try handleUserInput()
            
            if try validateEmail(email: input) {
                onSuccess()
                requestPassword(email: input){
                    print("""
                        
                        ========================
                        
                        Signed in correctly as \(input)\n
                        ========================
                        
                        """)
                } onFailure: {
                    runLoginMenu()
                }
            }
            
            
            
        } catch InputErrors.invalidInput {
            print("Invalid Input")
            onFailure()
            
        } catch LoginErrors.inexistentEmail{
            print("No user registered with that e-mail")
            onFailure()
        }
        catch {
            onFailure()
        }
        
        
    }
    
    //Checa que el e-mail exista
    func validateEmail(email: String) throws -> Bool {
        var isValid = false
        
        if UsersDB().users.keys.contains(email) {
            isValid = true
        }
        else {
            throw LoginErrors.inexistentEmail
        }
        
        return isValid
    }
    
    func requestPassword(email: String, onSuccess: () -> Void, onFailure: () -> Void) {
        do {
            print("Enter your password: ")
            let password = try handleUserInput()
            if try validatePassword(email: email, password: password) {
                onSuccess()
                let signedInUser: User = UsersDB().users[email] ?? UsersDB().dummyUser
                sendToCorrespondingMenu(user: signedInUser)
            }
        }
        catch LoginErrors.wrongPassword {
            print("\nWrong password, try again")
            onFailure()
        }
        catch {
            onFailure()
        }
    }
    
    func validatePassword(email: String, password: String) throws -> Bool{
        var isValid = false
        
        if UsersDB().users[email]?.password == password {
            isValid = true
        } else {
            throw LoginErrors.wrongPassword
        }
        
        return isValid
    }
    
    func sendToCorrespondingMenu(user: User) {
        if user.isAdmin {
            AdminMenu(signedInUser: user).runMenu()
        }
        else {
            RegularUserMenu(signedInUser: user).runMenu()
        }
    }
    
}
