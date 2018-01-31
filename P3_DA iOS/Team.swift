//
//  Player.swift
//  P3_DA iOS
//
//  Created by William on 26/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Team {
    // MARK: - Vars
    var characters = [Character]()
    var uniqueCharacterNamesArray = [String]()
    
    // MARK: - Methods
    
    // A function that displays all the characters of the team
    func describeTeam() {
        var x = 1
        for character in characters {
            print("\(x).", terminator: " ")
            character.describeCharacter()
            x += 1
        }
    }
    
    // A function that calculate all the life points of characters in a team
    func calculateTeamLife() -> Int {
        var teamLife = 0
        for character in characters {
            teamLife += character.life
        }
        return teamLife
    }
    
    // A function that create three characters
    func createCharacters() {
        var choiceUser = 0
        var characterList = [Character]()
        let rankingArray = ["first", "second", "third"]
        
        // A loop to create three characters
        for i in 0..<3 {
            
            print()
            print("Choose your \(rankingArray[i]) characters:")
            print("1 - Warrior")
            print("2 - Wizard")
            print("3 - Titan")
            print("4 - Dwarf")
            
            repeat {
                choiceUser = Input.inputInt()
                if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4 {
                    print("Enter a number between 1 and 4 !")
                }
            } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
            
            // For the user to indicate the name of his character
            print()
            print("Enter a name for your character:")
            var characterName = ""
            repeat {
                characterName = Input.inputString()
                if uniqueCharacterNamesArray.contains(characterName) {
                    print("This name is already used by another character. Choose a new one:")
                    characterName = ""
                } else {
                    uniqueCharacterNamesArray.append(characterName)
                }
            } while characterName == ""
            
            switch choiceUser {
            case 1:
                let warrior = Warrior(name: characterName)
                characterList.append(warrior)
            case 2:
                let wizard = Wizard(name: characterName)
                characterList.append(wizard)
            case 3:
                let titan = Titan(name: characterName)
                characterList.append(titan)
            case 4:
                let dwarf = Dwarf(name: characterName)
                characterList.append(dwarf)
            default:
                break
            }
            print()
            print("You add a \(characterList[i].type) to your team called \(characterList[i].name)")
            
        }
        characters = characterList
    }
}


