//
//  Championship.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

public struct Championship {
    
    static let shared: Championship = {
        let instance = Championship()
        return instance
    }()
    
    var teams: [Team] = []
    
    var teamsPositions: [(Team, Int)] {
        
        
        return [(Team(), 0)]
    }
    
    func nextTeamID() -> Int {
        
        return Championship.shared.teams.count
    }
    
}

// First place should take the team with the highest points score, last place with lowest
//If several teams have the same score then they should be sorted by the name in ascending order
//var sortedArray = [1, 5, 2].sort(ascending) // [1,2,5]
