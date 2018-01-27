//
//  Stick.swift
//  P3_DA iOS
//
//  Created by William on 13/01/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import Foundation

class Stick: Weapon {
    
    init() {
        super.init(name: "Stick", damage: 0, magicPower: 35, type: .Heal)
    }
}
