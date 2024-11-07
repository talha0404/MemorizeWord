//
//  StudyContracts.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.09.2023.
//

import Foundation

protocol StudyViewModelProtocol {
    func fetchData(completion: (([StudyTableModel])->Void?))
}
