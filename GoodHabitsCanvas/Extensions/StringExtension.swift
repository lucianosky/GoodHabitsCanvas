//
//  StringExtension.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 28/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

extension String {
    
    subscript (bounds: CountableClosedRange<Int>) -> String? {
        guard
            let start = index(startIndex, offsetBy: bounds.lowerBound, limitedBy: self.endIndex),
            let end = index(startIndex, offsetBy: bounds.upperBound, limitedBy: self.endIndex),
            self.count > bounds.upperBound
            else {
                return nil
        }
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String? {
        guard
            let start = index(startIndex, offsetBy: bounds.lowerBound, limitedBy: self.endIndex),
            let end = index(startIndex, offsetBy: bounds.upperBound, limitedBy: self.endIndex),
            self.count > bounds.upperBound
            else {
                return nil
        }
        return String(self[start..<end])
    }
    
}
