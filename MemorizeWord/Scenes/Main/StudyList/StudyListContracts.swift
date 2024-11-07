//
//  StudyListContracts.swift
//  MemorizeWord
//
//  Created by talha.sahin on 22.11.2023.
//

import Foundation

protocol StudyListViewModelProtocol {
    var delegate: StudyListViewModelDelegate? { get set }
    var dataStudyList: [StudyListModel] { get set }
    func addStudyList(data: StudyListModel)
    func loadStudyList()
}

protocol StudyListViewModelDelegate {
    func addNewList(model: StudyListModel, completion: () -> Void)
}
