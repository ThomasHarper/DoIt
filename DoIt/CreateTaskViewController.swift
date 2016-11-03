//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Thomas Bentkowski on 03/11/2016.
//  Copyright © 2016 Thomas Bentkowski. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    /////////////////// OUTLETS ////////////////////
    @IBOutlet weak var taskNameText: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    ///////////////// PROPERTIES ///////////////////

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: AnyObject) {
        // Creating the context for CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create task from the outlets data
        let task = Task(context: context)
        task.name = taskNameText.text!
        task.important = importantSwitch.isOn
        
        // Saving task
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Going back to TasksViewController
        navigationController!.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
