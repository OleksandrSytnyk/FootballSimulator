//
//  ResultViewController.swift
//  FootballSimulator
//
//  Created by Oleksandr Sytnyk on 10/6/17.
//  Copyright © 2017 Oleksandr Sytnyk. All rights reserved.
//

import UIKit
import GlyuckDataGrid

class ResultViewController: UIViewController, DataGridViewDataSource, DataGridViewDelegate {
    
    var teams: [TeamAsResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teams = DataManager.shared.hardCodedTeams()
        
         let dataGridView = DataGridView(frame: view.bounds)
         view.addSubview(dataGridView)
        // You'll need to setup constraints for just created view
         dataGridView.translatesAutoresizingMaskIntoConstraints = false
         view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70.0-[dataGridView]-0.0-|", options: [], metrics: [:], views: ["dataGridView": dataGridView]))
         view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0.0-[dataGridView]-0.0-|", options: [], metrics: [:], views: ["dataGridView": dataGridView]))
        
        
        
        dataGridView.dataSource = self
        dataGridView.delegate = self
    }
    
    // MARK: - DataGridViewDataSource
    func numberOfRowsInDataGridView(_ dataGridView: DataGridView) -> Int {
        return teams.count
    }
    
    func numberOfColumnsInDataGridView(_ dataGridView: DataGridView) -> Int {
        return DataSource.columnsTitles.count
    }
    
    func dataGridView(_ dataGridView: DataGridView, titleForHeaderForColumn column: Int) -> String {
        return DataSource.columnsTitles[column]
    }

    func dataGridView(_ dataGridView: DataGridView, textForCellAtIndexPath indexPath: IndexPath) -> String {
        
        return teams[indexPath.dataGridRow].dataList[DataSource.columns[indexPath.dataGridColumn]]!
    }
    
    // MARK: - DataGridViewDelegate
    
    func dataGridView(_ dataGridView: DataGridView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
    func dataGridView(_ dataGridView: DataGridView, widthForColumn column: Int) -> CGFloat {
        return DataSource.columnsWidths[column]
    }
}
