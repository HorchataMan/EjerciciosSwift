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

func exitGame()
{
    print("Goodbye! See you next time!")
    exit(1)
}





//func determineWinner(playerChoice: GameOptions, aiChoice:GameOptions)
//{
//    switch (playerChoice, aiChoice)
//    {
//    case (.rock, .rock):
//        print("\nEmpate! Ambos eligieron Rock\n")
//    case (.rock, .paper):
//        print("\nPerdiste, Rock pierde contra Paper\n")
//    case (.rock, .scissors):
//        print("\nGanaste! Rock vence a Scissors\n")
//    case (.paper, .rock):
//        print("\nGanaste! Paper vence a Rock\n")
//    case (.paper, .paper):
//        print("\nEmpate! Ambos eligieron Paper\n")
//    case (.paper, .scissors):
//        print("\nPerdiste, Paper pierde contra Scissors\n")
//    case (.scissors, .rock):
//        print("\nPerdiste, Scissors pierde contra Rock\n")
//    case (.scissors, .paper):
//        print("\nGanaste! Scissors vence a Paper\n")
//    case (.scissors, .scissors):
//        print("\nEmpate! Ambos eligieron Scissors\n")
//    default:
//        print("\nAlgo ha salido mal, lo sentimos :(")
//    }
//}

let rps = RockPaperScissor()

let gameController = GameController(rpsInstance: rps)

func main()
{
//    var option:GameOptions
//    repeat
//    {
//        showOptions()
//        option = optionPicker(takeChoice())
//        optionEvaluation(option: option)
//    } while option == .invalid || option != .exit
    
    gameController.gameLoop()
    
}

main()
