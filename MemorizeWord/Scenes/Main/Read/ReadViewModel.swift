//
//  ReadViewModel.swift
//  MemorizeWord
//
//  Created by talha.sahin on 3.09.2023.
//

import Foundation

public class ReadViewModel: ReadViewModelProtocol  {
 
    var readListModel: [ReadModel] = []
    
    /// Create BaseViewModel and put fetchData function to use all viewModels
    func fetchData(completion: (([ReadModel])->Void?)) {
        readListModel = [ReadModel(id: 1, title: "Technology", image: "desktopcomputer"),
                         ReadModel(id: 2, title: "Science", image: "figure.walk.departure"),
                         ReadModel(id: 3, title: "Culture", image: "person.3.sequence"),
                         ReadModel(id: 4, title: "Health", image: "heart.circle"),
                         ReadModel(id: 5, title: "Literature", image: "books.vertical"),
                         ReadModel(id: 6, title: "Art", image: "photo.artframe"),
                         ReadModel(id: 7, title: "Biography", image: "stopwatch"),
                         ReadModel(id: 8, title: "Others", image: "ellipsis")]
        completion(readListModel)
    }
}

