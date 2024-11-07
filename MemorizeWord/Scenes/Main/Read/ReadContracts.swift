//
//  ReadContracts.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.09.2023.
//

import Foundation

protocol ReadViewModelProtocol {    
    var readListModel: [ReadModel] { get set }
    func fetchData(completion: (([ReadModel])->Void?))
}
