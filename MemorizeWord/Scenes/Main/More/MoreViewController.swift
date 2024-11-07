//
//  MoreViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 7.06.2023.
//

import UIKit

class MoreViewController: BaseViewController {
    
    private var data: [Data] = []
    var vm: MoreViewModelProtocol = MoreViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        configureNavBar()
        vm.fetchData() { displayData in
            data = displayData
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    override func viewWillAppear(_ animated: Bool) { }
    
    override func viewWillDisappear(_ animated: Bool) { }
    
    override func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(hex: "B73C25")
        navigationItem.title = "More"
        navigationController?.navigationBar.tintColor = .white
    }
}

extension MoreViewController: UITableViewDataSource {
    
    //This func is for generating Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    /// This is for rows for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].sectionRows.count
    }
    
    // Create a standard header that includes the returned text.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier, for: indexPath) as? MoreTableViewCell {
            
            cell.title.text = data[indexPath.section].sectionRows[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension MoreViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 30 : 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
