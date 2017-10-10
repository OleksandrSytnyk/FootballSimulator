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
        return teams.count + 1
    }
    
    static var games: [Game] = []
    
    static func startChampionship() {
        
        for team1 in Championship.teams {
            for team2 in Championship.teams {
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
