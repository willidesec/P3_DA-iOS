//
//  Sword.swift
//  P3_DA iOS
//
//  Created by William on 19/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Sword: Weapon {
    init() {
        super.init(name: "Sword", damage: 10, magicPower: 0, type: .attack)
    }
}
