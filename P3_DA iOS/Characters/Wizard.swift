//
//  Wizard.swift
//  P3_DA iOS
//
//  Created by William on 24/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Wizard: Character {
    init(name: String) {
        super.init(name: name, type: .Wizard, life: 90, weapon: Wand())
    }
    
    override func attack(target: Character) {
        print("The Wizard can't attack")
    }
    
    func heal(target: Character) {
        if self.life > 0 && target.life > 0 {
        target.life += self.weapon.magicPower
        }
    }
}
