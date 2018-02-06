//
//  Game.swift
//  P3_DA iOS
//
//  Created by William on 26/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Game {
    // MARK: - Vars
    var teams = [Team]()
    let numberOfTeams = 2
    var numberOfLaps = 0
    var startGameDate = NSDate()
    
    // MARK: - Methods
    
    // A function that launch the game
    func start() {

        welcomeMessage()
        
        // Creation of two teams
        for i in 0..<numberOfTeams {
            print()
            print("Creation of Team \(i + 1)")
            let team = createTeam()
            teams.append(team)
        }
        
        // Description of the two teams
        for i in 0..<teams.count {
            let currentTeam = teams[i]
            print()
            print("============================================================================")
            print("                       Composition of Team \(i + 1)")
            print("============================================================================")
            currentTeam.describeTeam()
        }
        
        // Launch the fight
        teamsFight()
        // Display the Winner
        displayWinner()
        // Display the statistics of the game
        displayStatistics()
    }
    
    // A function that create a Team
    func createTeam() -> Team {
        let team = Team()
        team.createCharacters()
        return team
    }
    
    func welcomeMessage() {
        print("============================================================================")
        print("                      ⚔️  Welcome in DEATH GAME !  ⚔️")
        print("                           A two team Deathmatch")
        print("                              Only one winner")
        print("============================================================================")
    }
    
    // A loop which repeat the character's fight until a team die
    func teamsFight() {
        print()
        print("============================================================================")
        print("                            ⚔️ Fight ! ⚔️")
        print("============================================================================")
        repeat {
            characterFight()
            numberOfLaps += 1
        } while teams[0].calculateTeamLife() != 0 && teams[1].calculateTeamLife() != 0
    }
    
    // A function that give a action for each player once
    func characterFight() {
    
            for i in 0..<2 {
            
                var choiceUser = 0
                var characterSelected: Character?
                var target: Character?
                
                // Choice of the character to use
                print()
                print("Team \(i + 1):")
                print("Choose a character from your team")
                teams[i].describeTeam()
                
                repeat {
                    choiceUser = Input.inputInt()
                    if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                        print("Enter a number between 1 and 3 !")
                    }
                } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                
                characterSelected = teams[i].characters[choiceUser - 1]
                
                guard let currentCharacter = characterSelected else { return }
                
                // Apparition of the magic chest
                magicChest(character: currentCharacter)
                
                // If the current character is a mage
                if let wizard = currentCharacter as? Wizard {
                    print()
                    print("Choose a character to heal")
                    teams[i].describeTeam()
                    
                    repeat {
                        choiceUser = Input.inputInt()
                        if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                            print("Enter a number between 1 and 3 !")
                        }
                    } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                    
                    target = teams[i].characters[choiceUser - 1]
                    guard let currentTarget = target else { return }
                    
                    wizard.heal(target: currentTarget)
                    
                    // Display the action that has just been performed
                        print()
                        print("\(currentCharacter.name) healed \(currentTarget.name) and give \(currentCharacter.weapon.magicPower) points of life")

                } else {
                    
                    // Choice of the character to attack
                    print()
                    print("Choose a character to attack")
                    teams[1 - i].describeTeam()
                    
                    repeat {
                        choiceUser = Input.inputInt()
                        if choiceUser != 1 && choiceUser != 2 && choiceUser != 3 {
                            print("Enter a number between 1 and 3 !")
                        }
                    } while choiceUser != 1 && choiceUser != 2 && choiceUser != 3
                    
                    target = teams[1 - i].characters[choiceUser - 1]
                    guard let currentTarget = target else { return }
                    
                    currentCharacter.attack(target: currentTarget)
                    
                    // Display the action that has just been performed
                    if currentCharacter.life != 0 && currentTarget.life != 0 {
                        print()
                        print("\(currentCharacter.name) attacked \(currentTarget.name) and inflicted \(currentCharacter.weapon.damage) points of damage")
                    }
                
                    if currentTarget.life == 0 {
                        print()
                        print("\(currentTarget.name) is dead ! \(currentCharacter.name) inflicted \(currentCharacter.weapon.damage) points of dammage and kill him")
                    }
                }
                
                // We calculate the life of each team and we leave the loop if one of the two teams reaches 0
                if teams[i].calculateTeamLife() == 0 || teams[1 - i].calculateTeamLife() == 0 {
                    return
                }
            }
    }

    // A function that appear the Magic Chest
    func magicChest(character: Character) {
        let randomNumber = arc4random_uniform(101)
        if randomNumber <= 10 {
            print()
            print("============================================================================")
            print("                       🌟 A Magic Chest appear 🌟")
            print("                 It contains a lot of powerful weapons !")
            print("                                   ⚡️")
            
            if let wizard = character as? Wizard {
                wizard.weapon = Stick()
                print("      \(character.name) is now equiped with the \(character.weapon.name) which heal \(character.weapon.magicPower) points of life !")
                
            } else {
                character.weapon = Exterminator()
                print("      \(character.name) is now equiped with the \(character.weapon.name) which inflicte \(character.weapon.damage) damage !")
            }
            print("============================================================================")
        }
    }
    
    // A function that display the Winner
    func displayWinner() {
        if teams[0].calculateTeamLife() > 0 {
            print()
            print("============================================================================")
            print("                   👑 The Winner is the Team 1 ! 👑")
            print("============================================================================")
        } else {
            print()
            print("============================================================================")
            print("                   👑 The Winner is the Team 2 ! 👑")
            print("============================================================================")
        }
        
        print()
        print("                           End of the game !")
    }
    
    // A function that display the statistics of the game
    func displayStatistics() {
        print()
        print("============================================================================")
        print("                           Game statistics")
        print("                          Number of laps: \(numberOfLaps)")
        print("                     Duration of the game: \(showTimer(startGameDate: startGameDate))")
        print("============================================================================")
    }
    
    // A function to calculate the duration of the game
    func showTimer(startGameDate: NSDate) -> String {
        let interval = NSDate().timeIntervalSince(startGameDate as Date)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        guard let timer = formatter.string(from: interval) else { return "" }
        return timer
    }
}


