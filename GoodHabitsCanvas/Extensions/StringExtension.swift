//
//  StringExtension.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 28/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

extension String {
    
    var numbers: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
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
    
    subscript(range: Range<Int>) -> String {
        return self.substring(with: range)
    }

    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    
    func substring(to: String) -> String {
        if let index = range(of: to) {
            return String(self[..<index.lowerBound])
        }
        return self
    }
    
    func limit(to: Int) -> String {
        if count > to {
            return String(self[..<index(startIndex, offsetBy: to)])
        }
        return self
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }

}
