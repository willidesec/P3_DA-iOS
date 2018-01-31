//
//  Hammer.swift
//  P3_DA iOS
//
//  Created by William on 21/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Hammer: Weapon {
    init() {
        super.init(name: "Hammer", damage: 5, magicPower: 0, type: .attack)
    }
}
