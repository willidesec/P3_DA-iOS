//
//  Input.swift
//  P3_DA iOS
//
//  Created by William on 29/01/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import Foundation

class Input {
    // Saves what the user write in the console and turns it into Int
    static func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }
    
    // Saves what the user write in the console and turns it into String
    static func inputString() -> String {
        guard let data = readLine() else { return "" }
        return data
    }
}
