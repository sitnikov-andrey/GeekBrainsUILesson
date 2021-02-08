//
//  NewGroupeViewController.swift
//  GeekBrainsUILesson
//
//  Created by Андрей Ситников on 27.01.2021.
//

import UIKit

class NewGroupsViewController: UITableViewController {
    
    var newGroups = ["Группа новостей", "Группа популярной науки"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath)
        guard let newGroupCell = cell as? NewGroupViewCell else { return cell }
        newGroupCell.newGroupNameLabel?.text = newGroups[indexPath.row]
        return newGroupCell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(newGroups)
//        newGroups.remove(at: indexPath.row)
//        //tableView.deleteRows(at: [indexPath], with: .automatic)
//        tableView.reloadData()
//    }
}
