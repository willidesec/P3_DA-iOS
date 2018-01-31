//
//  Weapon.swift
//  P3_DA iOS
//
//  Created by William on 19/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Weapon {
    // MARK: - Vars
    var name: String
    var damage: Int
    var magicPower: Int
    let type: WeaponType
    
    // MARK: - Init
    init(name: String, damage: Int, magicPower: Int, type: WeaponType) {
        self.name = name
        self.damage = damage
        self.magicPower = magicPower
        self.type = type
    }
}

// MARK: - Weapon Type Enum
enum WeaponType {
    case attack, heal
}
