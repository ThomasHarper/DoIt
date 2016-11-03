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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
