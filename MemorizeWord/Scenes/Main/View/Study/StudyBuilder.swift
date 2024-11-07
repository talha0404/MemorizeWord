//
//  StudyBuilder.swift
//  MemorizeWord
//
//  Created by talha.sahin on 5.09.2023.
//

import Foundation
import UIKit

class StudyBuilder {
    static func build() -> UIViewController {
        let studyView = UIStoryboard(name: "StudyView", bundle: nil)
        let studyViewController = studyView.instantiateViewController(withIdentifier: "StudyViewController")
        studyViewController.tabBarItem.image = UIImage(systemName: "book")
        studyViewController.title = "Study"
        
        return studyViewController
    }
}
