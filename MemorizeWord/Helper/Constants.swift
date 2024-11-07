//
//  Constants.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.08.2023.
//
import Foundation
import UIKit

public enum Constants {
    static let dictionaryApi: String = ""
    static let bgColor: String = "B73C25"
    
   static func setStatusBarBackgroundColor(hexCode: String) {
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
             statusBar.backgroundColor = UIColor(hex: hexCode)
             UIApplication.shared.keyWindow?.addSubview(statusBar)
        } else {
            UIApplication.shared.statusBarUIView?.backgroundColor = UIColor(hex: hexCode)
        }
    }
}

public enum StoryboardName {
    static let studyList: String = "StudyListViewController"
    static let studyNote: String = ""
    static let studyFlashCards: String = ""
    static let studyMultipleChoice: String = ""
    static let studyListening: String = ""
}
