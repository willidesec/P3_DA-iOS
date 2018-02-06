//
//  Wizard.swift
//  P3_DA iOS
//
//  Created by William on 24/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Wizard: Character {
    // MARK: - Init
    init(name: String) {
        super.init(name: name, type: .wizard, life: 90, weapon: Wand())
    }
    
    // MARK: - Methods
    override func attack(target: Character) {
        print("The Wizard can't attack")
    }
    
    func heal(target: Character) {
        if target.life == target.maxLife {
            print("The character's life is full, you can't heal him")
        } else if self.life > 0 && target.life > 0 {
            target.life += self.weapon.magicPower
            if target.life > target.maxLife {
                target.life = target.maxLife
            }
        }
    }
    
    override func describeCharacter() {
        if life == 0 {
            print("\(name) is dead !")
        } else {
            print("\(type) - \(name) - Life points: [\(life)/\(maxLife)] - Weapon: \(weapon.name) - Magic Power: \(weapon.magicPower) ")
        }
    }
}


