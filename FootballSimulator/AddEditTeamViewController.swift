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
    
     @IBOutlet var textField: UITextField?
    var delegate: AddEditTeamViewControllerDelegate?
    var teamToEditName: String?
    var teamNames: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "AddTeam" 
        
        self.textField?.delegate = self
        textField?.becomeFirstResponder()
        
        if let teamToEditName = teamToEditName {
        textField?.text = teamToEditName
        }
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
        } else {
            guard let text = textField?.text else {return}
            teamName = text
        }
        
        guard validate(text: teamName) else { return }
        delegate?.addEditTeamViewControllerDidAddEdit(self, didFinishAddingEditing: teamName)
    }
    
    func validate(text: String) -> Bool {
        
        guard  (text.characters.count > 0) && (text.characters.count < 26) else {
            let alert = getValidationAlert(message: "The length of the team name has to be more than zero and no more than 25 characters.")
            present(alert, animated: true, completion: nil)
            return false
        }
        guard text.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil  else {
            let alert = getValidationAlert(message: "The team name can contain only alphabetic and numeric characters.")
            present(alert, animated: true, completion: nil)
            return false
        }
        guard let teamNames = teamNames else { return true }
        guard teamNames.contains(text) else { return true }
            let alert = getValidationAlert(message: "The list of teams you chosed contains already this name. Choose another one.")
            present(alert, animated: true, completion: nil)
            return false
    }
}
