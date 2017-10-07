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
    
    var teams = Championship.shared.teams

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
                let teamToEdit = teams[indexPath.row]
                controller?.teamToEdit = teamToEdit
            }
        }
    }
    
    func addEditTeamViewControllerDidCancel(_ controller: AddEditTeamViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addEditTeamViewController(_ controller: AddEditTeamViewController) {
       teams = Championship.shared.teams
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
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TeamCell", for: indexPath)
        //if let cell = cell as? TeamCell {}
            let team = teams[indexPath.row]
            //TODO: decouple code: String(indexPath.row) + "." + team.name
            cell.textLabel?.text = team.name
        
        return cell
    }
}

extension HomeViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        //addEdit = HomeViewController.edit
        performSegue(withIdentifier: showAddEdit, sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        teams.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        }
    }

/*
 
 func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
 dismiss(animated: true, completion: nil)
 }
 
 func itemDetailViewController(_ controller: ItemDetailViewController,
 didFinishAdding item: ChecklistItem) {
 let newRowIndex = checklist.items.count
 checklist.items.append(item)
 
 let indexPath = IndexPath(row: newRowIndex, section: 0)
 let indexPaths = [indexPath]
 tableView.insertRows(at: indexPaths, with: .automatic)
 
 dismiss(animated: true, completion: nil)
 }
 
 func itemDetailViewController(_ controller: ItemDetailViewController,
 didFinishEditing item: ChecklistItem) {
 if let index = checklist.items.index(of: item) {
 let indexPath = IndexPath(row: index, section: 0)
 if let cell = tableView.cellForRow(at: indexPath) {
 configureText(for: cell, with: item)
 }
 }
 dismiss(animated: true, completion: nil)
 }
 
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 if segue.identifier == "AddItem" {
 let navigationController = segue.destination as! UINavigationController
 let controller = navigationController.topViewController as! ItemDetailViewController
 controller.delegate = self
 
 } else if segue.identifier == "EditItem" {
 let navigationController = segue.destination as! UINavigationController
 let controller = navigationController.topViewController as! ItemDetailViewController
 controller.delegate = self
 
 if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
 controller.itemToEdit = checklist.items[indexPath.row]
 }
 }
 }*/

