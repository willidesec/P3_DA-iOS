//
//  Player.swift
//  P3_DA iOS
//
//  Created by William on 26/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Team {
    var characters = [Character]()
    var teamLife = 0
    
    
    func describeTeam() {
        var x = 1
        for character in characters {
            print("\(x).", terminator: " ")
            character.describeCharacter()
            x += 1
        }
    }
    
    func calculateTeamLife() {
        teamLife = 0
        for character in characters {
            teamLife += character.life
        }
    }
}


