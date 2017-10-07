//
//  Championship.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class Championship {
    
    public static let shared: Championship = {
        let instance = Championship()
        return instance
    }()
    
    var teams: [Team] = []
    
    var teamsPositions: [Team: Int] {
        
        
        return [Team(): 0]
    }
    
    func nextTeamID() -> Int {
        return Championship.shared.teams.count + 1
    }
    
    func startChampionship() {
        for team1 in teams {
            for team2 in teams {
                
                let game = Game()
                game.play(team1: team1, team2: team2)
                
            }
            
        }//TODO: map
    }
    
}

// First place should take the team with the highest points score, last place with lowest
//If several teams have the same score then they should be sorted by the name in ascending order
//var sortedArray = [1, 5, 2].sort(ascending) // [1,2,5]
