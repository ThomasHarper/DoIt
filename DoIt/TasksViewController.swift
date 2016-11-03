//
//  TasksViewController.swift
//  DoIt
//
//  Created by Thomas Bentkowski on 02/11/2016.
//  Copyright © 2016 Thomas Bentkowski. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️ \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTasks () -> [Task] {
        let taskOne = Task()
        taskOne.name = "Faire la vaisselle"
        
        let taskTwo = Task()
        taskTwo.name = "Promener le chien"
        taskTwo.important = true
        
        let taskThree = Task()
        taskThree.name = "Sortir la poubelle"
        
        return [taskOne, taskTwo, taskThree]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextViewController = segue.destination as! CreateTaskViewController
            nextViewController.previousViewController = self
        } else if segue.identifier == "selectTaskSegue" {
            let nextViewController = segue.destination as! CompleteTaskViewController
            nextViewController.task = sender as! Task
            nextViewController.previousViewController = self
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

