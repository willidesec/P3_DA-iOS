//
//  Wand.swift
//  P3_DA iOS
//
//  Created by William on 19/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Wand: Weapon {
    
    init() {
        super.init(name: "Wand", damage: 0, magicPower: 20, type:.Heal)
    }    
}


