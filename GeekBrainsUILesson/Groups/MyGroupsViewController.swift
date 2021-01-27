//
//  GroupsViewController.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    
    var myGroups = ["Группа любителей кошек", "Группа со смешными картинками"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupCell", for: indexPath)
        guard let myGroupCell = cell as? MyGroupViewCell else { return cell }
        myGroupCell.myGroupNameLabel?.text = myGroups[indexPath.row]
        return myGroupCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                myGroups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
}
