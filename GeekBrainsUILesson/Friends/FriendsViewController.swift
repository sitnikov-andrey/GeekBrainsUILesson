//
//  FriendsViewController.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    @IBOutlet weak var selecterName: FriendNameSelectorControl?
    
    var friends = ["Андрей", "Егор", "Ольга", "Мария"]
    var persons = ["person1", "person2", "person3", "person4"]
    var litters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selecterName?.addTarget(self,
                                action: #selector(handleIndexTaitleChange),
                                for: .valueChanged)
        //Получаем буквы с которых начинаются имена без дубликатов
        litters = Array(Set(friends.map({ String ($0.prefix(1)) })))
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return FriendName.allStrings
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return FriendName.allCases.count
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        return FriendName.init(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView,
                            sectionForSectionIndexTitle title: String,
                            at index: Int) -> Int {
        tableView.scrollToRow(at: IndexPath(row: 0, section: index),
                              at: .top,
                              animated: true)
        return index
    }
    

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        guard let friendCell = cell as? FriendViewCell else { return cell }
        friendCell.friendImageView?.image = UIImage(named: persons[indexPath.row])
        friendCell.friendNameLabel?.text = friends[indexPath.row]
        return friendCell
    }
    
    @objc func handleIndexTaitleChange() {
        //guard let index = selecterName?.selectedName?.rawValue else { return }
    }


}
