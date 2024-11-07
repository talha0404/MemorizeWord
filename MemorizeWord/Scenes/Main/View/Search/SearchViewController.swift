//
//  SearchViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 7.06.2023.
//
import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var searchBarView: SearchBarView!
    var vm: SearchViewModelProtocol = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // It triggered when page is about to open
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
        adjustKeyboard()
    }
    
    // It works when disappear page
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(hex: "B73C25")
        navigationItem.title = "Search"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.circle"), style: .done, target: self, action: nil),
            UIBarButtonItem(title: "Save" , style: .done, target: self, action: nil)
        ]
    }
    
    private func adjustKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
