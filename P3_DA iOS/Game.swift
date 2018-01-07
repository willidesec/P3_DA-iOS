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
    let numberOfTeams = 2
    
    func start() {
        print("Welcome in DEATH GAME !")
        print("A two team Deathmatch")
        print("Only one winner")
        print()
        
        for i in 0..<numberOfTeams {
            print()
            print("Creation of Team \(i + 1)")
            let team = Team()
            team.characters = createCharacter()
            teams.append(team)
        }
        
        var x = 1
        for team in teams {
            print()
            print("Composition of Team \(x)")
            team.describeTeamType()
            x += 1
        }
        
        // On lance le combat en tour par tour
        print()
        print("Fight !")
        repeat {
            combat()
        } while !(teams[0].characters.isEmpty) || !(teams[1].characters.isEmpty)
    }
    

    
    
    
    
    
    func createCharacter() -> [Character] {
        var choiceUser = 0
        var characterList = [Character]()
        
        // Une boucle pour créer trois personnages
        for i in 0..<3 {
        
            print()
            print("Choose \(3 - i) characters:")
            print("1 - Warrior")
            print("2 - Wizard")
            print("3 - Titan")
            print("4 - Dwarf")
        
            repeat {
                choiceUser = inputInt()
                if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4 {
                    print("Enter a number between 1 and 4 !")
                }
            } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3 && choiceUser != 4
     
        
            // Pour que l'utitlisateur indique le nom de son personnage
            print()
            print("Enter a name for your character:")
            var characterName = ""
                repeat {
                    characterName = inputString()
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
        return characterList
    }
    
    
    
    
    
    
    
    
    
    
    func combat() {
    
            for x in 0..<2 {
            
                var choiceUser = 0
                var choiceUser2 = 0
                
                displayTeams()
                
                // Choix du personnage à utilisé
                print()
                print("Team \(x + 1):")
                print("Choose a character from your team")
                teams[x].describeTeamType()
                
                repeat {
                    choiceUser = inputInt()
                    if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                        print("Enter a number between 1 and 3 !")
                    }
                } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                
                
                
                // Choix du personnage à attaquer
                print()
                print("Choose a character to attack")
                teams[1 - x].describeTeamType()
                
                repeat {
                    choiceUser2 = inputInt()
                    if choiceUser2 != 1 && choiceUser2 != 2 && choiceUser2 != 3 {
                        print("Enter a number between 1 and 3 !")
                    }
                } while choiceUser2 != 1 && choiceUser2 != 2 && choiceUser2 != 3
                
                
                
                
                var target  = Character(name: "", type: .Dwarf, life: 1, weapon: Sword())
                // Switch pour déterminer la cible
                switch choiceUser2 {
                case 1:
                    target = teams[1 - x].characters[0]
                case 2:
                    target = teams[1 - x].characters[1]
                case 3:
                    target = teams[1 - x].characters[2]
                default:
                    break
                }
                
                //Switch pour déterminer l'attaquant
                switch choiceUser {
                case 1:
                    teams[x].characters[0].attack(target: target)
                case 2:
                    teams[x].characters[1].attack(target: target)
                case 3:
                    teams[x].characters[2].attack(target: target)
                default:
                    break
                }
                
                // On affiche l'action qui vient d'être effectué
                print()
                print("\(teams[x].characters[choiceUser - 1].name) attacked \(teams[1 - x].characters[choiceUser2 - 1].name) and inflicted \(teams[x].characters[choiceUser - 1].weapon.damage) points of damage")
                
                // Si un personnage à 0 point de vie, alors on le supprime du tableau
                if target.life == 0 {
                    teams[1 - x].characters.remove(at: choiceUser2 - 1)
                    print("\(target.type) - \(target.name) is dead")
                }
                
                // Trouver un moyen de sortir de la boucle for si une des deux équipes n'a plus de personnages
                if teams[0].characters.isEmpty || teams[1].characters.isEmpty {
                    break
                }
            }
        
        
    }
    
    
    
    

    
    func displayTeams() {
        for x in 0..<2 {
            print()
            print("Team \(x + 1):")
            for character in teams[x].characters {
                character.describeCharacter()
            }
        }
    }
    
    
    
    
    // Enregistre ce que l'utilisateur tape dans la console et le transforme en Int
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    // Enregistre ce que l'utilisateur tape dans la console et le transforme en String
    func inputString() -> String {
        guard let data = readLine() else { return "" }
        return data
    }
    
    
}

