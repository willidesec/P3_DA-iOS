//
//  Character.swift
//  P3_DA iOS
//
//  Created by William on 19/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

enum Type {
    case Warrior, Wizard, Titan, Dwarf
}

class Character {
    let name: String
    let type: Type
    var life: Int
    var weapon: Weapon
    
    init(name: String, type: Type, life: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
    }
    
    
    // Une fonction permmettant d'attaquer un autre personnage et de lui enlever des points de vie en fonction des dégats de l'arme
    func attack(target: Character) {
        if self.life > 0 && target.life > 0 {
        target.life -= self.weapon.damage
        }
        
         // Si la vie est négatif, on la ramène à 0 pour dire que le personnage est mort
        if target.life < 0 {
            target.life = 0
        }
    }
    
}
