//
//  MoreContracts.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.09.2023.
//

import Foundation

protocol MoreViewModelProtocol {
    func fetchData(completion: (([Data]) -> Void))
}
