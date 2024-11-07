//
//  SearchBuilder.swift
//  MemorizeWord
//
//  Created by talha.sahin on 5.09.2023.
//

import Foundation
import UIKit

class SearchBuilder {
    static func build() -> UIViewController {                
        let searchView = UIStoryboard(name: "SearchView", bundle: nil)
        let searchViewController = searchView.instantiateViewController(withIdentifier: "SearchViewController")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchViewController.title = "Search"
        
        return searchViewController
    }
}
