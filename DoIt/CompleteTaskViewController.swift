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
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            taskLabel.text = "❗️ \(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
        
    }
    @IBAction func completeTapped(_ sender: AnyObject) {
        // Deleting task from CoreData always through the context then saving the new context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Poping back to the previous ViewController
        navigationController!.popViewController(animated: true)
    }
}
