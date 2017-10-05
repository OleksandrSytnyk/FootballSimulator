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
    func addEditTeamViewController(_ controller: AddEditTeamViewController,
                                   didFinishAdding team: Team)
    func addEditTeamViewController(_ controller: AddEditTeamViewController,
                                   didFinishEditing team: Team)
}

class AddEditTeamViewController: UIViewController {
    
     @IBOutlet public var textField: UITextField?
    //var addEdit = ""
    var delegate: AddEditTeamViewControllerDelegate?
    var teamToEdit: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let teamToEdit = teamToEdit {
        textField?.text = teamToEdit.name
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func cancel() {
        delegate?.addEditTeamViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let teamToEdit = teamToEdit {
            guard let text = textField?.text else {return}
             teamToEdit.name = text
             delegate?.addEditTeamViewController(self, didFinishEditing: teamToEdit)
        } else {
            let team = Team()
             guard let text = textField?.text else {return}
             team.name = text
            delegate?.addEditTeamViewController(self, didFinishAdding: team)
        }
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
