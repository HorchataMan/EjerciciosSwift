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
    \nSelect an option
    0 - Rock
    1 - Paper
    2 - Scissors
    3 - Quit
    -----------
    """)
}

func takeChoice() -> Int
{
    
    guard let input = readLine() else
    {
        return 4
    }
    
    guard let choice = Int(input) else
    {
        return 4
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
        print("That's not a valid option\n")
        //showOptions()
        //takeChoice()
    default:
        determineWinner(playerChoice: option, aiChoice: aiPick())
    }
    
    
}

func determineWinner(playerChoice: GameOptions, aiChoice:GameOptions)
{
    switch (playerChoice, aiChoice)
    {
    case (.rock, .rock):
        print("\nEmpate! Ambos eligieron Rock\n")
    case (.rock, .paper):
        print("\nPerdiste, Rock pierde contra Paper\n")
    case (.rock, .scissors):
        print("\nGanaste! Rock vence a Scissors\n")
    case (.paper, .rock):
        print("\nGanaste! Paper vence a Rock\n")
    case (.paper, .paper):
        print("\nEmpate! Ambos eligieron Paper\n")
    case (.paper, .scissors):
        print("\nPerdiste, Paper pierde contra Scissors\n")
    case (.scissors, .rock):
        print("\nPerdiste, Scissors pierde contra Rock\n")
    case (.scissors, .paper):
        print("\nGanaste! Scissors vence a Paper\n")
    case (.scissors, .scissors):
        print("\nEmpate! Ambos eligieron Scissors\n")
    default:
        print("\nAlgo ha salido mal, lo sentimos :(")
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
