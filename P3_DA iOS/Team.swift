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
    
    func describeTeamType() {
        var x = 1
        for character in characters {
            print("\(x) - \(character.type)")
            x += 1
        }
    }
}
