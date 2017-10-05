//
//  HomeViewController.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet public var tableView: UITableView?
    @IBOutlet public var simulateButton: UIButton?
    @IBOutlet public var addTeamButton: UIButton?
    @IBOutlet public var addTeamTextField: UITextField?
    
    
    let ShowResult = "ShowResult"
    var teams: [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if tableView?.dataSource == nil {
            tableView?.dataSource = self
        }
    }
    
    @IBAction func simulate(_ sender: UIButton) {
    performSegue(withIdentifier: ShowResult, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == ShowResult {
        
            }
    }
    
    @IBAction func addTeam(_ sender: UIButton) {
        let team = Team()
        
        if let name = addTeamTextField?.text, !name.isEmpty {
            team.name = name
            teams.append(team)
        }
        
     
    }
}



extension HomeViewController : UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

/**/

