//
//  ReadViewController.swift
//  MemorizeWord
//
//  Created by talha.sahin on 7.06.2023.
//

import UIKit

class ReadViewController: BaseViewController {

    @IBOutlet weak var readCollectionView: UICollectionView!
    
    private let vm: ReadViewModelProtocol = ReadViewModel()
    private var data: [ReadModel] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        readCollectionView.dataSource = self
        readCollectionView.delegate = self
        configureNavBar()
        
        vm.fetchData(){ readListModels in
            data = readListModels
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(hex: "B73C25")
        navigationItem.title = "Read"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: nil)
        ]
    }
}

extension ReadViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let readCell = readCollectionView.dequeueReusableCell(withReuseIdentifier: ReadCollectionViewCell.identifier, for: indexPath) as? ReadCollectionViewCell {
            readCell.imageView.image = UIImage(systemName: data[indexPath.row].image)
            readCell.imageDesc.text = data[indexPath.row].title
            return readCell
        }
        return UICollectionViewCell()
    }
}

extension ReadViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (readCollectionView.frame.width-10) / 2
        let height = width + 15
        
        return CGSize(width: width, height: height)
    }
}
