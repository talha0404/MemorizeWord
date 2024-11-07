//
//  MoreBuilder.swift
//  MemorizeWord
//
//  Created by talha.sahin on 5.09.2023.
//

import Foundation
import UIKit

class MoreBuilder {
    static func build() -> UIViewController {        
        let moreView = UIStoryboard(name: "MoreView", bundle: nil)
        let moreViewController = moreView.instantiateViewController(withIdentifier: "MoreViewController")
        moreViewController.tabBarItem.image = UIImage(systemName: "ellipsis")
        moreViewController.title = "More"
        
        return moreViewController
    }
}
