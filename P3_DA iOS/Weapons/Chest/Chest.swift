//
//  Chest.swift
//  P3_DA iOS
//
//  Created by William on 13/01/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import Foundation

class Chest {
    var chest = [Weapon]()
    
    init() {
        chest.append(contentsOf: [Exterminator(), Flail(), Stick()])
    }
}



