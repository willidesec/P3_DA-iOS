//
//  Warrior.swift
//  P3_DA iOS
//
//  Created by William on 24/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Warrior: Character {
    init(name: String) {
        super.init(name: name, type: .Warrior, life: 100, weapon: Sword())
        
    }
}
