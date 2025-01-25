//
//  structs.swift
//  PiedraPapelTijera
//
//  Created by Jan Petrina on 25/01/2025.
//

struct RockPaperScissor {
    
    //var choice: GameOptions
    
    func aiPick() -> GameOptions {
        
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
    
    func optionPicker(_ choice: Int) -> GameOptions {
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
}


struct GameController {
    
    var rpsInstance: RockPaperScissor
    
    
    let ruleRelations = [
    ["Tie!", "You Lose :(", "You Win :)"],
    ["You Win :)", "Tie!", "You Lose :("],
    ["You Lose :(", "You Win :)", "Tie!"]
    ]
    

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
    
    func determineWinner(playerChoice: GameOptions, aiChoice: GameOptions){
        
        print("\nYou chose: \(playerChoice)")
        print("\nOpponent chose: \(aiChoice)")
        
        print("\nResult: \(ruleRelations[playerChoice.rawValue][aiChoice.rawValue])")
        print("\n=============")
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
            determineWinner(playerChoice: option, aiChoice: rpsInstance.aiPick())
        }
        
        
    }
    
    func gameLoop(){
        var option:GameOptions
        repeat
        {
            showOptions()
            option = rpsInstance.optionPicker(takeChoice())
            optionEvaluation(option: option)
        } while option == .invalid || option != .exit
    }
}
