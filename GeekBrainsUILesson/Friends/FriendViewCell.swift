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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        friendImageView?.layer.cornerRadius = 30
        friendImageView?.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
