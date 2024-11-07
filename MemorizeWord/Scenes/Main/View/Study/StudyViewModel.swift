//
//  StudyViewModel.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.09.2023.
//

import Foundation


public class StudyViewModel: StudyViewModelProtocol {
        
    func fetchData(completion: (([StudyTableModel])->Void?)) {
        let studyTableModel = [StudyTableModel(name: "Lists", imgName: "list.bullet.clipboard"),
                               StudyTableModel(name: "Notes", imgName: "note.text"),
                               StudyTableModel(name: "FlashCards", imgName: "menucard"),
                               StudyTableModel(name: "Multiple Choice", imgName: "checklist"),
                               StudyTableModel(name: "Listening Practise", imgName: "volume.2")]
        completion(studyTableModel)
    }
}
