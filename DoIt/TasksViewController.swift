//
//  TasksViewController.swift
//  DoIt
//
//  Created by Thomas Bentkowski on 02/11/2016.
//  Copyright © 2016 Thomas Bentkowski. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /////////////////// OUTLETS ////////////////////
    @IBOutlet weak var tableView: UITableView!
    ///////////////// PROPERTIES ///////////////////
    var tasks : [Task] = []
    
    // This is called everytime the viewController is about to show up
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    // This is called one time at the beginning
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            cell.textLabel?.text = "❗️ \(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
           tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("We've got an error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue" {
            let nextViewController = segue.destination as! CompleteTaskViewController
            nextViewController.task = sender as? Task
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

