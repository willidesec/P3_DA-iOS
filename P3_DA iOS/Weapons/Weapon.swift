//
//  Weapon.swift
//  P3_DA iOS
//
//  Created by William on 19/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Weapon {
    var name: String
    var damage: Int
    var magicPower: Int
    
    init(name: String, damage: Int, magicPower: Int) {
        self.name = name
        self.damage = damage
        self.magicPower = magicPower
    }
}
