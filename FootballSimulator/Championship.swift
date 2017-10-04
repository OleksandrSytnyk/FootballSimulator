//
//  Championship.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

public struct Championship {
    
    var teams: [Team] = []
    
    var teamsPositions: [String: Int] {
        return ["": 0]
    }
    
}

// First place should take the team with the highest points score, last place with lowest
//If several teams have the same score then they should be sorted by the name in ascending order
