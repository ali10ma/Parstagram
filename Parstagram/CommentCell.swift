//
//  CommentCell.swift
//  Parstagram
//
//  Created by Ali Ma on 3/12/21.
//

import UIKit

// ––––– Lab 6： Displaying Comments
class CommentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
