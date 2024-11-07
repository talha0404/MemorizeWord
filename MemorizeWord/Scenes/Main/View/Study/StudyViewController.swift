//
//  StudyViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 7.06.2023.
//

import UIKit

class StudyViewController: UIViewController {

    var vm: StudyViewModelProtocol = StudyViewModel()
    private var data: [StudyTableModel] = []
    @IBOutlet weak var studyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        studyTableView.dataSource = self
        studyTableView.delegate = self
        configureNavBar()
        
        vm.fetchData(){ studyModels in
            data = studyModels
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {}
    
    override func viewWillDisappear(_ animated: Bool) {}
    
    private func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(hex: "B73C25")
        navigationItem.title = "Study"
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func configureUITableView() {
        studyTableView.showsVerticalScrollIndicator = false
        studyTableView.showsHorizontalScrollIndicator = false
        
        studyTableView.separatorStyle = .none
    }
}

extension StudyViewController :UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudyTableViewCell.identifier, for: indexPath) as? StudyTableViewCell else {
            return UITableViewCell()
        }
        cell.title.text = data[indexPath.row].name
        cell.titleImg.image = UIImage(systemName: data[indexPath.row].imgName)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if StoryboardName.studyList == "StudyListViewController" {
            let studyListVC = UIStoryboard(name: "StudyList", bundle: nil).instantiateViewController(withIdentifier: "StudyListViewController") as! StudyListViewController
            studyListVC.title = "Study List"
            
            let studyListVM = StudyListViewModel()
            studyListVM.delegate = studyListVC            
            studyListVC.vm = studyListVM
            
            self.navigationController?.pushViewController(studyListVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

struct StudyTableModel {
    var name: String
    var imgName: String
    var routeName: String?
}
