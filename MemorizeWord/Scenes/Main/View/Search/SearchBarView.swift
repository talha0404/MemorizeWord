//
//  SearchBarView.swift
//  MemorizeWord
//
//  Created by talha.sahin on 6.08.2023.
//

import Foundation
import UIKit

final class SearchBarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "SearchBarView") else { return }
        view.layer.cornerRadius = 10.0
        view.frame = self.bounds
        self.addSubview(view)
    }
}
