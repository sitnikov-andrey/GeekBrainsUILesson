//
//  FriendsViewController.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var friends = [User(userName: "Андрей", userPhoto: "person1"),
                   User(userName: "Егор", userPhoto: "person2"),
                   User(userName: "Ольга", userPhoto: "person3"),
                   User(userName: "Мария", userPhoto: "person4")]
    var letters = [Character]()
    var friendsDict = [Character: [User]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Получаем буквы с которых начинаются имена, без дубликатов
        letters = getLetters()
        //Получаем словаь сопостовления букв и User
        friendsDict = getFriendsDict()
    }
    
    private func getLetters() -> [Character] {
        var ltrs: [Character]
        
        ltrs = friends.map({$0.letter})

        ltrs = ltrs.sorted()

        ltrs = ltrs.reduce([], { (list, name) -> [Character] in
            if !list.contains(name) {
                return list + [name]
            }
            return list
        })
        return ltrs
    }
    
    private func getFriendsDict() -> [Character: [User]] {
        var contacts = [Character: [User]]()

        for user in friends {
            
            if contacts[user.letter] == nil {
                contacts[user.letter] = [User]()
            }

            contacts[user.letter]!.append(user)

        }

        for (letter, usersList) in contacts {
            contacts[letter] = usersList.sorted { $0.userName < $1.userName }
        }
        
        return contacts
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [String](Set<String>(friends.map({$0.letter.description}))).sorted()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return letters.count
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        return String (letters[section])
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
        return friendsDict[letters[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        guard let friendCell = cell as? FriendViewCell else { return cell }
        friendCell.friendImageView?.image = UIImage(named: friendsDict[letters[indexPath.section]]![indexPath.row].userPhoto)
        friendCell.friendNameLabel?.text =  friendsDict[letters[indexPath.section]]?[indexPath.row].userName
        return friendCell
    }
}
