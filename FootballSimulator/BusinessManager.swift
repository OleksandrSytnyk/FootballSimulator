//
//  BusinessManager.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/5/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation

class BusinessManager {
    
   func setHardCodedTeams() -> [Team] {
    var teams: [Team] = []
    for index in 1...8 {
        let team = Team()
        team.name = "Team" + String(index)
        teams.append(team)
    }
    return teams
    }
}


