//
//  Dwarf.swift
//  P3_DA iOS
//
//  Created by William on 24/12/2017.
//  Copyright © 2017 William Désécot. All rights reserved.
//

import Foundation

class Dwarf: Character {
    init(name: String) {
        super.init(name: name, type: .Dwarf, life: 60, weapon: Axe())
    }
}
