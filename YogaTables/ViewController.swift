//
//  ViewController.swift
//  YogaTables
//
//  Created by Shawn Flahave on 4/19/18.
//  Copyright © 2018 Shawn Flahave. All rights reserved.
//

import UIKit
import YogaKit

class ViewController: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        view.configureLayout { layout in
            layout.isEnabled = true
        }
        
        tableView.configureLayout { layout in
            layout.isEnabled = true
            layout.height = YGValue(value: 100, unit: .percent)
            layout.width = YGValue(value: 100, unit: .percent)
        }
        
        view.yoga.applyLayout(preservingOrigin: true)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row0Id = "ROW0"
        let row1Id = "ROW1"
        let row2Id = "ROW2"
        
        switch indexPath.row {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: row0Id) as? CustomCell
            if cell == nil {
                cell = CustomCell(reuseIdentifier: row0Id)
                cell!.labelText = "Name"
            }
            cell!.valueText = "Mr. Bungle"
            return cell!
            
        case 1:
            var cell = tableView.dequeueReusableCell(withIdentifier: row1Id) as? CustomCell
            if cell == nil {
                cell = CustomCell(reuseIdentifier: row1Id)
                cell!.labelText = "Song"
            }
            cell!.valueText = "Slowly Growing Deaf"
            return cell!
            
        case 2:
            var cell = tableView.dequeueReusableCell(withIdentifier: row2Id) as? CustomCell
            if cell == nil {
                cell = CustomCell(reuseIdentifier: row2Id)
                cell!.labelText = "Watch your back "
                cell!.valueText = nil
            }
            return cell!
            
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}
