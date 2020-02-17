//
//  BaseView.swift
//  RemotelyCoffee
//
//  Created by Stephanie on 2/15/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

@IBDesignable class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.configure()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        
    }
    
}
