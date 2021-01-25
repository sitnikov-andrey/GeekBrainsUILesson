//
//  FriendsViewController.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    let friends = ["Андрей", "Егор", "Ольга", "Мария"]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        guard let friendCell = cell as? FriendViewCell else { return cell }
        friendCell.friendImageView?.image = UIImage(named: "person")
        friendCell.friendNameLabel?.text = friends[indexPath.row]
        return friendCell
    }

}
