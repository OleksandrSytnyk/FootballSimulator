//
//  DataSource.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/6/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import Foundation
import UIKit

class DataSource {
    
    static let columnsTitles = ["#", "Team", "P", "W", "D", "L", "Pts", "GF", "GA", "GD"]
    static let columns = ["position", "teamName", "gamesPlayed", "gamesWon", "gamesDrawn", "gamesLost", "points", "goalsForward", "goalsAgainst", "goalsDifference"]
    static let columnsWidths: [CGFloat] = [30, 150, 30, 30, 30, 30, 50, 40, 40, 40]
}
