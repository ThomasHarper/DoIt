//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Thomas Bentkowski on 03/11/2016.
//  Copyright © 2016 Thomas Bentkowski. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    /////////////////// OUTLETS ////////////////////
    @IBOutlet weak var taskLabel: UILabel!
    ///////////////// PROPERTIES ///////////////////
    var task = Task()
    var previousViewController = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            taskLabel.text = "❗️ \(task.name)"
        } else {
            taskLabel.text = task.name
        }
        
    }
    @IBAction func completeTapped(_ sender: AnyObject) {
        previousViewController.tasks.remove(at: previousViewController.selectedIndex)
        previousViewController.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
