//
//  MainTabBarViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 7.06.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    // Every Tab should have different NavigationController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let searchVC = SearchBuilder.build()
        let studyVC = StudyBuilder.build()
        let readVC = ReadBuilder.build()
        let moreVC = MoreBuilder.build()

        tabBar.tintColor =  UIColor(hex: "D55140")
        self.setViewControllers([searchVC,studyVC,readVC,moreVC], animated: true)
    }
       
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
