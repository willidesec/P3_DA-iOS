//
//  Titan.swift
//  P3_DA iOS
//
//  Created by William on 24/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Titan: Character {
    init(name: String) {
        super.init(name: name, type: .Titan, life: 150, weapon: Hammer())
    }
}

