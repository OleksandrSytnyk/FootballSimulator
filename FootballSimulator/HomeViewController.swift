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
    
    let ShowResult = "ShowResult"

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

