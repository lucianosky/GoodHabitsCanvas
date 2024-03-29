//
//  UIViewControllerExtension.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 30/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @discardableResult func activateConstraints(_ visualFormat: String, views: [String : Any], metrics: [String : Any]? = nil) -> [NSLayoutConstraint] {
        
        return NSLayoutConstraint.activate(visualFormat, views: views, metrics: metrics)
    }
    
}
