//
//  DataManager.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/5/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared: DataManager = {
        let instance = DataManager()
        return instance
    }()
    
    func startChampionship(teamsNames: [String])  -> [TeamAsResult] {
        createChampionship(teamsNames: teamsNames)
        Championship.startChampionship()
        fillTeamsWithData()
        return transformTeamsToTeamsAsResults()
    }
    
    func fillTeamsWithData() {
        for team in Championship.teams {
            var gamesWon = 0
            var gamesDrawn = 0
            var gamesLost  = 0
            var goalsForward = 0
            var goalsAgainst = 0
            
            for game in Championship.games {
                let team1EqualTeam = game.team1 == team
                let team2EqualTeam = game.team2 == team
                guard team1EqualTeam || team2EqualTeam else { continue }
                
                if team1EqualTeam {
                    switch game.score {
                    case 0:
                        gamesDrawn += 1
                    case let x where x < 0:
                        gamesLost += 1
                        goalsAgainst += game.score
                    default:
                        gamesWon += 1
                        goalsForward += game.score
                    }
                    continue
                }
                switch game.score {
                case 0:
                    gamesDrawn += 1
                case let x where x < 0:
                    gamesWon += 1
                    goalsForward += game.score
                default:
                    gamesLost += 1
                    goalsAgainst += game.score
                }
            }
            if let index = Championship.teams.index(of: team) {
            Championship.teams[index].goalsForward = abs(goalsForward)
                Championship.teams[index].goalsAgainst = abs(goalsAgainst)
                Championship.teams[index].gamesWon = gamesWon
                Championship.teams[index].gamesDrawn = gamesDrawn
                Championship.teams[index].gamesLost = gamesLost
            }
        }
        sortTeams()
    }
        
    func sortTeams() {
        
        let sortedTeamsToDefinePositions = Championship.teams.sorted(by: sorterForTeams)
        
        for index in 0...sortedTeamsToDefinePositions.count - 1 {
            Championship.teamsPositions[sortedTeamsToDefinePositions[index]] = index + 1
        }
        
        var sortedTeams: [Team] = []
        for position in 1...Championship.teams.count {
            sortedTeams.append(Championship.teamsPositions.filter { $1 == position }.map { $0.0 }[0])
        }
        Championship.teams = sortedTeams
    }

    func sorterForTeams(this:Team, that:Team) -> Bool {
        
        if this.points != that.points {
        return this.points > that.points
        }
        return this.name < that.name
    }
    
    func createChampionship(teamsNames: [String]) {
        
        for teamName in teamsNames {
            let team = Team()
            team.name = teamName
            Championship.teams.append(team)
        }
    }
    
    func transformTeamsToTeamsAsResults() -> [TeamAsResult] {
        var teamsAsResults: [TeamAsResult] = []
        let teams = Championship.teams
        
        for team in teams {
            var teamAsResult = TeamAsResult()
            //Don't change the order to append
            if let position = Championship.teamsPositions[team] {
              teamAsResult.dataList["position"] = String(describing: position)
            }
            
            teamAsResult.dataList["teamName"] = team.name
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


