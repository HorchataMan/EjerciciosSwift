//
//  Errors.swift
//  SnowTrails
//
//  Created by Jan Petrina on 05/02/2025.
//

enum LoginErrors: Error {
    case inexistentEmail
    case wrongPassword
}

enum InputErrors: Error {
    case invalidInput
    case nonNumericInput
}

enum AccountErrors: Error {
    case usedEmail
    case invalidEmail
    case shortPassword
    case nonExistentUser
}
