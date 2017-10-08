//
//  Game.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/6/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class Game: Equatable {
    
    static let maxNumberGoalsPerGame = 5
    var team1: Team
    var team2: Team
    //if the score is positive it means team1 won.
    var score: Int
    
    init( team1: Team, team2: Team) {
        self.team1 = team1
        self.team2 = team2
       let team1Goals = Int(arc4random_uniform(UInt32(Game.maxNumberGoalsPerGame)))
        let team2Goals = Int(arc4random_uniform(UInt32(Game.maxNumberGoalsPerGame)))
        self.score = team1Goals - team2Goals
    }
    
    static func ==(lhs: Game, rhs: Game) -> Bool {
        return ((lhs.team1.id == rhs.team1.id)&&(lhs.team2.id == rhs.team2.id))||((lhs.team1.id == rhs.team2.id)&&(lhs.team2.id == rhs.team1.id))
    }
}
