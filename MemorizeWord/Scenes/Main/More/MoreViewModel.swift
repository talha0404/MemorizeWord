//
//  MoreViewModels.swift
//  MemorizeWord
//
//  Created by talha.sahin on 3.09.2023.
//

import Foundation

public class MoreViewModel: MoreViewModelProtocol  {
    
    private var displayData: [Data] = []
    
    private var sections: [Section] = [
        Section(id: 1, sectionTitle: "Settings"),
        Section(id: 2, sectionTitle: "Information")]
    
    private var sectionsData: [SectionData] = [
        SectionData(id: 1, sectionId: 1, sectionRowDesc: "Notification Reminder"),
        SectionData(id: 2, sectionId: 1, sectionRowDesc: "Synchronization"),
        SectionData(id: 3, sectionId: 1, sectionRowDesc: "Remove Ads"),
        SectionData(id: 4, sectionId: 2, sectionRowDesc: "About Us"),
        SectionData(id: 5, sectionId: 2, sectionRowDesc: "Terms of Use")]
    
     func fetchData(completion: (([Data]) -> Void)) {
        for section in sections {
            let sectionsDatas = sectionsData
                .filter{ $0.sectionId == section.id }
                .map { $0.sectionRowDesc }
           
            displayData.append(
                Data(sectionTitle: section.sectionTitle,
                     sectionRows: sectionsDatas))
        }
        
        completion(displayData)
    }
}

public struct Data {
    public var sectionTitle: String
    public var sectionRows: [String]
}
