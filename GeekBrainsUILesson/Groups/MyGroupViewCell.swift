import UIKit

class MyGroupViewCell: UITableViewCell {

    @IBOutlet weak var myGroupImageView: UIImageView?
    @IBOutlet weak var myGroupNameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
