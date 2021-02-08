//
//  FriendViewCell.swift
//  GeekFirst
//
//  Created by Андрей Ситников on 24.01.2021.
//

import UIKit

class FriendViewCell: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel?
    
    @IBOutlet weak var friendImageView: UIImageView?
    
    @IBOutlet weak var shodowFriendImageView: UIView?
    
    override func awakeFromNib() {
       super.awakeFromNib()
       configureViews()
    }
    
    private func configureViews() {
        backgroundColor = .clear
        friendImageView?.backgroundColor = .white
        shodowFriendImageView?.backgroundColor = .white
        friendImageView?.layer.cornerRadius = 30
        shodowFriendImageView?.layer.cornerRadius = 35
        shodowFriendImageView?.layer.shadowOffset = CGSize(width: -10 , height: 0)
        shodowFriendImageView?.layer.shadowRadius = 10
        shodowFriendImageView?.layer.shadowColor = UIColor.black.cgColor
        shodowFriendImageView?.layer.shadowOpacity = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
