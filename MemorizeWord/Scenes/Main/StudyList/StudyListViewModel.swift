//
//  StudyListViewModel.swift
//  MemorizeWord
//
//  Created by talha.sahin on 22.11.2023.
//

import Foundation

class StudyListViewModel: StudyListViewModelProtocol {
    var delegate: StudyListViewModelDelegate?
    var dataStudyList: [StudyListModel] = []
    
    func loadStudyList() {
       let model = StudyListModel(title: "My List", terms: "27 Term", learned: "1 Learned", notLearned: "26 Not Learned")
        dataStudyList.append(model)
    }
    
    func addStudyList(data: StudyListModel) {
        dataStudyList.append(data)
    }
}
