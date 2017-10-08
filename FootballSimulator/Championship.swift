//
//  Championship.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class Championship {
    static var teams: [Team] = []
    
    static var teamsPositions: [Team: Int] = [:]
   static var nextTeamID: Int {
        get {
            return teams.count + 1
        }
        
//        set {
//            self = newValue
//        }
    }
    
    static var games: [Game] = []
    
//    init() {
//        for team in Championship.teams {
//            Championship.teamsPositions[team] = 0
//        }
//    }
    
   static func startChampionship() {
        for team1 in Championship.teams {
            for team2 in Championship.teams {
                guard team1 != team2 else { continue }
                let gameToAdd = Game(team1: team1, team2: team2)
                
                if Championship.games.count == 0 {
                    Championship.games.append(gameToAdd)
                }
                var foundTheSame = false

                for game in Championship.games {
                    if game == gameToAdd {
                    foundTheSame = true
                    }
                }
                guard !foundTheSame else { continue }
                Championship.games.append(gameToAdd)
            }
        }
    }
}
