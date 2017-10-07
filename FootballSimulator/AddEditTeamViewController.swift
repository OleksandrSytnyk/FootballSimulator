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
    func addEditTeamViewControllerDidAddEdit(_ controller: AddEditTeamViewController, didFinishAddingEditing teamName: String)
}

class AddEditTeamViewController: UIViewController, UITextFieldDelegate {
    
     @IBOutlet public var textField: UITextField?
    //var addEdit = ""
    var delegate: AddEditTeamViewControllerDelegate?
    var teamToEditName: String?
    //var teams = Championship.shared.teams

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField?.delegate = self
        textField?.becomeFirstResponder()
        
        if let teamToEditName = teamToEditName {
        textField?.text = teamToEditName
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
        var teamName = ""
        if let _ = teamToEditName {
            guard let text = textField?.text else {return}
            teamName = text
            //delegate?.addEditTeamViewController(self, didFinishEditing: teamToEdit)
        } else {
            guard let text = textField?.text else {return}
            teamName = text
        }
        delegate?.addEditTeamViewControllerDidAddEdit(self, didFinishAddingEditing: teamName)
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
