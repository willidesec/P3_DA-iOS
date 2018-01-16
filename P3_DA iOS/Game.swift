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
    var uniqueCharacterNamesArray = [String]()
    
    func start() {
        print("Welcome in DEATH GAME !")
        print("A two team Deathmatch")
        print("Only one winner")
        print()
        
        // Création des deux équipes
        createTeams()
        
        // Description des deux équipes
        teamsComposition()
        
        // On lance le combat en tour par tour
        teamsFight()
        
        // On affiche le gagant
        displayWinner()
    }
    
    
    
    
    
    func createTeams() {
        for i in 0..<numberOfTeams {
            print()
            print("Creation of Team \(i + 1)")
            let team = Team()
            team.characters = createCharacter()
            teams.append(team)
        }
    }
    
    func teamsComposition() {
        var x = 1
        for team in teams {
            print()
            print("Composition of Team \(x)")
            team.describeTeam()
            x += 1
        }
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
//                    if uniqueCharacterNamesArray.contains(characterName) {
//                        print("Ce nom")
//                        characterName = ""
//                    } else {
//                        uniqueCharacterNamesArray.append(characterName)
//                    }
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

    func teamsFight() {
        print()
        print("Fight !")
        repeat {
            characterFight()
        } while teams[0].calculateTeamLife() != 0 && teams[1].calculateTeamLife() != 0
    }
    
    
    func characterFight() {
    
            for x in 0..<2 {
            
                var choiceUser = 0
                var characterSelected: Character?
                var target: Character?
                
                
                // Choix du personnage à utilisé
                print()
                print("Team \(x + 1):")
                print("Choose a character from your team")
                teams[x].describeTeam()
                
                repeat {
                    choiceUser = inputInt()
                    if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                        print("Enter a number between 1 and 3 !")
                    }
                } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                
                characterSelected = teams[x].characters[choiceUser - 1]
                
                guard let currentCharacter = characterSelected else { return }
                
                
                // Apparition du coffre magique
                let randomNumber = arc4random_uniform(11)
                if randomNumber <= 10 {
                    magicChest(character: currentCharacter)
                }
                
                
                // Si le personnage sélectionné est un mage
                if let wizard = currentCharacter as? Wizard {
                    print()
                    print("Choose a character to heal")
                    teams[x].describeTeam()
                    
                    repeat {
                        choiceUser = inputInt()
                        if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                            print("Enter a number between 1 and 3 !")
                        }
                    } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                    
                    target = teams[x].characters[choiceUser - 1]
                    guard let currentTarget = target else { return }
                    
                    wizard.heal(target: currentTarget)
                    
                    // On affiche l'action qui vient d'être effectué
                    if currentTarget.life != currentTarget.maxLife {
                        print()
                        print("\(currentCharacter.name) healed \(currentTarget.name) and give \(currentCharacter.weapon.magicPower) points of life")
                    }

                } else {
                    
                    // Choix du personnage à attaquer
                    print()
                    print("Choose a character to attack")
                    teams[1 - x].describeTeam()
                    
                    repeat {
                        choiceUser = inputInt()
                        if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                            print("Enter a number between 1 and 3 !")
                        }
                    } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                    
                    target = teams[1 - x].characters[choiceUser - 1]
                    guard let currentTarget = target else { return }
                    
                    
                    currentCharacter.attack(target: currentTarget)
                    
                    // On affiche l'action qui vient d'être effectué
                    if currentCharacter.life != 0 && currentTarget.life != 0 {
                        print()
                        print("\(currentCharacter.name) attacked \(currentTarget.name) and inflicted \(currentCharacter.weapon.damage) points of damage")
                    }
                
                    if currentTarget.life == 0 {
                        print()
                        print("\(currentTarget.name) is dead ! \(currentCharacter.name) inflicted \(currentCharacter.weapon.damage) points of dammage and kill him")
                    }
                }
                
                // On calcule les points de vie de chaque équipe et on sort de la boucle si une des deux équipes arrive à 0
                if teams[x].calculateTeamLife() == 0 || teams[1 - x].calculateTeamLife() == 0 {
                    return
                }
            }
    }
    
    
    // Fonction du Coffre Magique
    func magicChest(character: Character) {
        print()
        print("A Magic Chest appear !!")
        print("It contains a lot of powerful weapons !")
        
        if let wizard = character as? Wizard {
            wizard.weapon = Stick()
            
            print()
            print("\(character.name) is now equiped with the \(character.weapon.name) which heal \(character.weapon.magicPower) points of life !")
            
        } else {
            character.weapon = Exterminator()
            
            print()
            print("\(character.name) is now equiped with the \(character.weapon.name) which inflicte \(character.weapon.damage) damage !")
        }
    }
    
    // Fonction qui affiche le gagnant de la partie
    func displayWinner() {
        if teams[0].calculateTeamLife() > 0 {
            print()
            print("The Winner is the Team 1 !")
        } else {
            print()
            print("The Winner is the Team 2 !")
        }
        
        print()
        print("End of the game !")
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


