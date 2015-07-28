//
//  Hole.swift
//  GolfScorecard
//
//  Created by Will Concannon on 7/27/15.
//  Copyright (c) 2015 Concannon Computing. All rights reserved.
//

import Foundation

class Hole {
    
    var number = Int()
    var par = Int()
    var score = Int()
    
    var holeInfo: String {
        return "\(number), \(par), \(score)"
    }
    
}
