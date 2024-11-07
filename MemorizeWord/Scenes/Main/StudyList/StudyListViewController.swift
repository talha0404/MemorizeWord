//
//  StudyListViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 18.09.2023.
//

import UIKit

class StudyListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var vm: StudyListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        configureNavBar()
        vm.loadStudyList()
        let cellNib = UINib(nibName: "StudyListTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: StudyListTableViewCell.identifier)
    }
    
    private func createActionSheets() -> UIAlertController {
        let alertController = UIAlertController(title: "Action Sheet", message: "Choose an action", preferredStyle: .actionSheet)

        // Add action buttons
        let action1 = UIAlertAction(title: "New List", style: .default) { (action) in
            self.openCreateListPopUp()
        }
        alertController.addAction(action1)

        let action2 = UIAlertAction(title: "Action 2", style: .default) { (action) in
            print("Academic Word List")
        }
        alertController.addAction(action2)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        alertController.addAction(cancelAction)
        
        return alertController
    }
    
    private func openCreateListPopUp() {
        let overLayer = CreateListOverLayerPopUp()
        overLayer.studyListDelegate = self
        overLayer.appear(sender: self)
    }

    @objc func savePreparedList(sender : UIButton) {
        let alertController = createActionSheets()
        
        // For iPad, set the popover presentation controller source view and source rect.
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        // Present the action sheet
        present(alertController, animated: true, completion: nil)
    }
}


extension StudyListViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
                
        let image = UIImage(systemName: "plus")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(hex: Constants.bgColor)
        imageView.frame = CGRect(x: 25, y: 8, width: 27, height: 27)
        headerView.addSubview(imageView)
        
        
        let label = UILabel()
        label.frame = CGRect.init(x: 75, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "Save Prepared List"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        
        headerView.addSubview(label)
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(savePreparedList(sender:)))
        headerView.addGestureRecognizer(gesture)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130 //It will be calculated with function
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dataStudyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: StudyListTableViewCell.identifier, for: indexPath) as? StudyListTableViewCell {
            cell.configureCell(model: vm.dataStudyList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension StudyListViewController: StudyListViewModelDelegate {
    func addNewList(model: StudyListModel, completion: () -> Void) {
        vm.addStudyList(data: model)
        completion()
        tableView.reloadData()
    }
}

