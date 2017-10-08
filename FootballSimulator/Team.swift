//
//  Team.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class Team: Equatable, Hashable {
    var id: Int = 0
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
    
    var goalsForward = 0
    var goalsAgainst = 0
    
    var goalsDifference: Int {
        return goalsForward - goalsAgainst
    }

    init() {
      self.id = Championship.nextTeamID
    }
    
    var hashValue: Int {
        return self.id
    }
    
    static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs.id == rhs.id
    }
}
