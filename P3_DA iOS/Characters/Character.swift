//
//  Character.swift
//  P3_DA iOS
//
//  Created by William on 19/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

enum Type {
    case warrior, wizard, titan, dwarf
}

class Character {
    // MARK: - Vars
    let name: String
    let type: Type
    var life: Int
    var weapon: Weapon
    let maxLife: Int
    
    // MARK: - Init
    init(name: String, type: Type, life: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
        self.maxLife = life
    }
    
    // MARK: - Methods
    
    // A function that allows you to attack another character and take away life points based on weapon damage
    func attack(target: Character) {
        if self.life > 0 && target.life > 0 {
            target.life -= self.weapon.damage
        } else if self.life == 0 {
            print("Your character is dead, he can't attack")
        } else if target.life == 0 {
            print("The target is already dead, you can't attack it")
        }
        
         // If life is negative, it is back to 0 to say that the character is dead
        if target.life < 0 {
            target.life = 0
        }
    }
    
    // A function that display all the characteristics of the character
    func describeCharacter() {
        if life == 0 {
            print("\(name) is dead !")
        } else {
            print("\(type) - \(name) - Life points: \(life) - Weapon: \(weapon.name) - Damage: \(weapon.damage) ")
            }
    }
}
