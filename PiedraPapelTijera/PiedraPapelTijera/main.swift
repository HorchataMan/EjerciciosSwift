//
//  main.swift
//  PiedraPapelTijera
//
//  Created by Jan Petrina on 23/01/2025.
//

import Foundation

enum GameOptions : Int
{
    case rock = 0
    case paper = 1
    case scissors = 2
    case exit = 3
    case invalid = 4
}

func aiPick() -> GameOptions
{
    let choice = Int.random(in: 0...2)
    
    switch choice
    {
    case 0:
            return GameOptions.rock
    case 1:
            return GameOptions.paper
    default:
            return GameOptions.scissors
    }
}

func optionPicker(_ choice: Int) -> GameOptions
{
    switch choice
    {
    case 0:
            return GameOptions.rock
    case 1:
            return GameOptions.paper
    case 2:
            return GameOptions.scissors
    case 3:
            return GameOptions.exit
    default:
        return GameOptions.invalid
    }
}

func exitGame()
{
    print("Goodbye! See you next time!")
    exit(1)
}

func showOptions()
{
    print("""
    Select an option
    0 - Rock
    1 - Paper
    2 - Scissors
    3 - Quit
    -----------
    """)
}

func takeChoice() -> Int
{
    let input = readLine()
    var choice = 4
    
    if input != nil
    {
        choice = Int(input!) ?? 4
    }
        else
    {
        return choice
    }
    
    return choice
    
}

func optionEvaluation(option: GameOptions)
{
    
    switch option
    {
    case .exit:
        exitGame()
    case .invalid:
        print("That's not a valid option")
        //showOptions()
        //takeChoice()
    default:
        determineWinner(playerChoice: option, aiChoice: aiPick())
    }
    
    
}

func determineWinner(playerChoice: GameOptions, aiChoice:GameOptions)
{
    if playerChoice == aiChoice
    {
         print("Empate, ambos eligieron lo mismo\n")
    }
    else if playerChoice == .rock
    {
        if aiChoice == .paper
        {
            print("Perdiste! Paper vence a Rock\n")
        }
        else if aiChoice == .scissors
        {
            print("Ganaste! Rock vence a Scissors\n")
        }
    }
    else if playerChoice == .paper
    {
        if aiChoice == .scissors
        {
            print("Perdiste! Scissors vence a Paper\n")
        }
        else if aiChoice == .rock
        {
            print("Ganaste! Paper vence a Rock\n")
        }
    }
    else if playerChoice == .scissors
    {
        if aiChoice == .rock
        {
            print("Perdiste! Rock vence a Scissors\n")
        }
        else if aiChoice == .paper
        {
            print("Ganaste! Scissors vence a Paper\n")
        }
    }
}

func main()
{
    var option:GameOptions
    repeat
    {
        showOptions()
        option = optionPicker(takeChoice())
        optionEvaluation(option: option)
    } while option == .invalid || option != .exit
    
}

main()
