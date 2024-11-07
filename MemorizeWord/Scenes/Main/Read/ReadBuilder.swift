//
//  ReadBuilder.swift
//  MemorizeWord
//
//  Created by talha.sahin on 5.09.2023.
//

import Foundation
import UIKit

class ReadBuilder {
    static func build() -> UIViewController {        
        let readView = UIStoryboard(name: "ReadView", bundle: nil)
        let readViewController = readView.instantiateViewController(withIdentifier: "ReadViewController")
        readViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        readViewController.title = "Read"
        
        return readViewController
    }
}
