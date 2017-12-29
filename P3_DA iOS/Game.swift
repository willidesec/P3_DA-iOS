//
//  Game.swift
//  P3_DA iOS
//
//  Created by William on 26/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Game {
    var teams = [Team]()
    var team1 = Team()
    var team2 = Team()
    
    
    func start() {
        print("Welcome in DEATH GAME !")
        print("A two team Deathmatch")
        print("Only one winner")
        print()
        
        teamsCreation()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func teamsCreation() {
        var choiceUser = 0
        
        print("Teams creation :")
        
        // Création de l'équipe 1
        
        // Une boucle pour créer trois personnages
        for i in 1...3 {
        
        print()
        print("Team 1: Choose \(4 - i) characters:")
        print("1 - Warrior")
        print("2 - Wizard")
        print("3 - Titan")
        print("4 - Dwarf")
        
        repeat {
            choiceUser = inputInt()
            if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4 {
                print("Enter a number between 1 and 4:")
            }
        } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
     
        
        // Pour que l'utitlisateur indique le nom de son personnage
        print()
        print("Enter a name for your character:")
        var characterName = ""
        if let name = readLine() {
            characterName = name
        }
        
        
        switch choiceUser {
        case 1:
            let character1 = Warrior(name: characterName)
            team1.characters.append(character1)
        case 2:
            let character1 = Wizard(name: characterName)
            team1.characters.append(character1)
        case 3:
            let character1 = Titan(name: characterName)
            team1.characters.append(character1)
        case 4:
            let character1 = Dwarf(name: characterName)
            team1.characters.append(character1)
        default:
            break
        }
        
        
        print()
        print("You add a \(team1.characters[i-1].type) to your team called \(team1.characters[i-1].name)")

        }
        
        // Création de l'équipe 2
        
        // Une boucle pour créer trois personnages
        for i in 1...3 {
            
            print()
            print("Team 2: Choose \(4 - i) characters:")
            print("1 - Warrior")
            print("2 - Wizard")
            print("3 - Titan")
            print("4 - Dwarf")
            
            repeat {
                choiceUser = inputInt()
                if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4 {
                    print("Enter a number between 1 and 4:")
                }
            } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
            
            
            // Pour que l'utitlisateur indique le nom de son personnage
            print()
            print("Enter a name for your character:")
            var characterName2 = ""
            if let name = readLine() {
                characterName2 = name
            }
            
            
            switch choiceUser {
            case 1:
                let character2 = Warrior(name: characterName2)
                team2.characters.append(character2)
            case 2:
                let character2 = Wizard(name: characterName2)
                team2.characters.append(character2)
            case 3:
                let character2 = Titan(name: characterName2)
                team2.characters.append(character2)
            case 4:
                let character2 = Dwarf(name: characterName2)
                team2.characters.append(character2)
            default:
                break
            }
            
            print()
            print("You add a \(team2.characters[i-1].type) to your team called \(team2.characters[i-1].name)")
            
        }
        
        
        print()
        print("The composition of Team 1 is:")
        for character in team1.characters {
            print(character.type)
        }
        
        print()
        print("The composition of Team 2 is:")
        for character in team2.characters {
            print(character.type)
        }
        
    }
    
    
    
    // Enregistre ce que l'utilisateur tape dans la console et le transforme en Int
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    
}

