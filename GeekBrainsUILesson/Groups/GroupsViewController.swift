//
//  GroupsViewController.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    let groups = ["Группа любителей кошек", "Группа со смешными картинками"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        guard let groupCell = cell as? GroupViewCell else { return cell }
        groupCell.groupNameLabel?.text = groups[indexPath.row]
        return groupCell
    }

}
