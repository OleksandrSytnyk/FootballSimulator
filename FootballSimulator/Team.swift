//
//  Team.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class Team: Equatable {
    var ID: Int
    var name = ""
    var gamesWon = 0
    var gamesDrawn = 0
    var gamesLost  = 0
    
    var gamesPlayed: Int {
        return (gamesWon + gamesDrawn + gamesLost)
    }
    var points: Int {
        return ( 3 * gamesWon + gamesDrawn)
    }
    
    init() {
      self.ID = Championship.shared.nextTeamID()
    }
    
    static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs.ID == rhs.ID
    }
}
