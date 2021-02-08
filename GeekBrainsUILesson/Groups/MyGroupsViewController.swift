//
//  GroupsViewController.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    
    var myGroups = ["Группа любителей кошек", "Группа со смешными картинками"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupCell", for: indexPath)
        guard let myGroupCell = cell as? MyGroupViewCell else { return cell }
        myGroupCell.myGroupNameLabel?.text = myGroups[indexPath.row]
        return myGroupCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                myGroups.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    
    @IBAction func didSelectGroup(segue: UIStoryboardSegue) {
        guard let newGroupController = segue.source as? NewGroupsViewController else { return }
        guard let selected = newGroupController.tableView.indexPathForSelectedRow else { return }
        let group = newGroupController.newGroups[selected.row]
        if !myGroups.contains(group) {
            myGroups.append(group)
            tableView.reloadData()
        }
    }
}
