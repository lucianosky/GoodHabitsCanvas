//
//  UIStackViewExtension.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 01/07/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import UIKit

extension UIStackView {
    
    convenience init(_ axis: NSLayoutConstraint.Axis) {
        self.init()
        self.axis = axis
        distribution  = .equalCentering
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
