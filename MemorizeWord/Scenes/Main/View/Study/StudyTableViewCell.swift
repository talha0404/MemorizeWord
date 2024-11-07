//
//  StudyTableViewCell.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.08.2023.
//

import UIKit

class StudyTableViewCell: UITableViewCell {

    static let identifier = "StudyTableViewCell"
    static let cellSpacingHeight: CGFloat = 5
   
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        contentView.layer.cornerRadius = 5
        separatorInset = UIEdgeInsets.zero
        
        titleImg.tintColor = .white
    }
}
