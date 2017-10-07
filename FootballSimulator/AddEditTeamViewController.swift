//
//  AddEditTeamViewController.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/5/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import UIKit

protocol AddEditTeamViewControllerDelegate: class {
    func addEditTeamViewControllerDidCancel(_ controller: AddEditTeamViewController)
    //func addEditTeamViewController(_ controller: AddEditTeamViewController,
     //                              didFinishAdding team: Team)
    func addEditTeamViewController(_ controller: AddEditTeamViewController)
}

class AddEditTeamViewController: UIViewController, UITextFieldDelegate {
    
     @IBOutlet public var textField: UITextField?
    //var addEdit = ""
    var delegate: AddEditTeamViewControllerDelegate?
    var teamToEdit: Team?
    var teams = Championship.shared.teams

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField?.delegate = self
        textField?.becomeFirstResponder()
        
        if let teamToEdit = teamToEdit {
        textField?.text = teamToEdit.name
        }
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() 
        saveTeam()
        return true
    }


    @IBAction func cancel() {
        delegate?.addEditTeamViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
       saveTeam()
    }
    
    func saveTeam() {
        if let teamToEdit = teamToEdit {
            guard let text = textField?.text, let index = teams.index(of: teamToEdit) else {return}
            teamToEdit.name = text
            teams[index] = teamToEdit
            
            //delegate?.addEditTeamViewController(self, didFinishEditing: teamToEdit)
        } else {
            let team = Team()
            guard let text = textField?.text else {return}
            team.name = text
            //teams.append(team)
            Championship.shared.teams.append(team)
        }
        delegate?.addEditTeamViewController(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
