//
//  OnBoardingViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 31.05.2023.
//

import UIKit

class OnBoardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickExplore(_ sender: Any) {        
        let customTabBarController = MainTabBarController()        
        customTabBarController.modalPresentationStyle = .fullScreen
        customTabBarController.modalTransitionStyle = .flipHorizontal
        self.present(customTabBarController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
