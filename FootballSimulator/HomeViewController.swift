//
//  HomeViewController.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/4/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, AddEditTeamViewControllerDelegate {
    
    @IBOutlet public var tableView: UITableView?
    @IBOutlet public var simulateButton: UIButton?
    @IBOutlet public var addTeamButton: UIBarButtonItem?
   

    let showAddEdit = "ShowAddEdit"
    let showResult = "ShowResult"
    var teamToEditTeamsIndex: Int?
    var teamsNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
//        let dataManager = DataManager()
//        teams = dataManager.setHardCodedTeams()
        if tableView?.dataSource == nil {
            tableView?.dataSource = self
        }
        
        if tableView?.delegate == nil {
            tableView?.delegate = self
        }
         
    }
    
    @IBAction func simulate(_ sender: UIButton) {
    performSegue(withIdentifier: showResult, sender: sender)
    }
    
    @IBAction func addTeam(_ sender: UIButton) {
        //addEdit = HomeViewController.add
        performSegue(withIdentifier: showAddEdit, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == showResult {
            
        } else if segue.identifier == showAddEdit {
            let navigationController = segue.destination as? UINavigationController
            let controller = navigationController?.topViewController as? AddEditTeamViewController
            //controller?.addEdit = addEdit
            controller?.delegate = self
            
            if let indexPath = sender as? IndexPath {
                let teamToEditName = teamsNames[indexPath.row]
                controller?.teamToEditName = teamToEditName
                teamToEditTeamsIndex = indexPath.row
            }
        }
    }
    
    func addEditTeamViewControllerDidCancel(_ controller: AddEditTeamViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addEditTeamViewControllerDidAddEdit(_ controller: AddEditTeamViewController, didFinishAddingEditing teamName: String) {
       
        if let index = teamToEditTeamsIndex {
            teamsNames[index] = teamName
            teamToEditTeamsIndex = nil
        } else {
            teamsNames.append(teamName)
        }
        
        tableView?.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
//    func addEditTeamViewController(_ controller: AddEditTeamViewController,
//                                  didFinishEditing team: Team) {
//        if let index = teams.index(of: team) {
//            teams[index] = team
//        }
//        tableView?.reloadData()
//        dismiss(animated: true, completion: nil)
//    }

}

extension HomeViewController : UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TeamCell", for: indexPath)
            let teamName = teamsNames[indexPath.row]
            //TODO: decouple code: String(indexPath.row) + "." + team.name
            cell.textLabel?.text = teamName
        
        return cell
    }
}

extension HomeViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: showAddEdit, sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        teamsNames.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        }
}

