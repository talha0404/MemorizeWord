//
//  MoreTableViewCell.swift
//  MemorizeWord
//
//  Created by talha.sahin on 3.09.2023.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    static let identifier = "moreTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
