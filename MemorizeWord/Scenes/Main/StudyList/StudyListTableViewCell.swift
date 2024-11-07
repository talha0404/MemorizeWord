//
//  StudyListTableViewCell.swift
//  MemorizeWord
//
//  Created by talha.sahin on 18.09.2023.
//

import UIKit

class StudyListTableViewCell: UITableViewCell {

    static let identifier = "studyListTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StudyListTableViewCell", bundle: nil)
    }
        
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var terms: UILabel!
    @IBOutlet weak var learned: UILabel!
    @IBOutlet weak var notLearned: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: StudyListModel) {
        title.text = model.title
        terms.text = model.terms
        learned.text = model.learned
        notLearned.text = model.notLearned
    }
}
