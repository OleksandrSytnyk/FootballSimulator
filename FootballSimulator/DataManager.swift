//
//  DataManager.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/5/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class DataManager {
    
    public static let shared: DataManager = {
        let instance = DataManager()
        return instance
    }()
    
   func setHardCodedTeams() -> [Team] {
    var teams: [Team] = []
    for index in 1...8 {
        let team = Team()
        team.name = "Team" + String(index)
        teams.append(team)
    }
    return teams
    }
    
    func hardCodedTeams() -> [TeamAsResult] {
        var teamsAsResults: [TeamAsResult] = []
        var teamAsResult = TeamAsResult()
        var list1 = ["position": "1", "teamName": "Team1", "gamesPlayed": "3", "gamesWon": "2", "gamesDrawn": "1", "gamesLost": "0", "points": "3", "goalsForward": "2", "goalsAgainst": "1", "goalsDifference": "0"]
        teamAsResult.dataList = list1
        teamsAsResults.append(teamAsResult)
         list1 = ["position": "2", "teamName": "Team2", "gamesPlayed": "5", "gamesWon": "2", "gamesDrawn": "3", "gamesLost": "0", "points": "3", "goalsForward": "2", "goalsAgainst": "1", "goalsDifference": "0"]
        teamAsResult.dataList = list1
        teamsAsResults.append(teamAsResult)
        return teamsAsResults
    }
    
    func transformTeamsToTeamsAsResults() -> [TeamAsResult] {
        var teamsAsResults: [TeamAsResult] = []
        let teams = Championship.teams
        
        for team in teams {
            var teamAsResult = TeamAsResult()
            //Don't change the order to append
            
            teamAsResult.dataList["position"] = String(String(describing: Championship.teamsPositions[team]))
            teamAsResult.dataList["name"] = team.name
            teamAsResult.dataList["gamesPlayed"] = String(team.gamesPlayed)
            teamAsResult.dataList["gamesWon"] = String(team.gamesWon)
            teamAsResult.dataList["gamesDrawn"] = String(team.gamesDrawn)
            teamAsResult.dataList["gamesLost"] = String(team.gamesLost)
            teamAsResult.dataList["points"] = String(team.points)
            teamAsResult.dataList["goalsForward"] = String(team.goalsForward)
            teamAsResult.dataList["goalsAgainst"] = String(team.goalsAgainst)
            teamAsResult.dataList["goalsDifference"] = String(team.goalsDifference)
            teamsAsResults.append(teamAsResult)
        }
        return teamsAsResults
    }
    
    
}


