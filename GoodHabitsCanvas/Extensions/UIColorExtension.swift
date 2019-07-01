//
//  UIColorExtension.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 01/07/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    // DARK THEME
    // TODO: Dracula Theme - Give credit
    static let background = UIColor(netHex: 0x282a36)
    static let headerBackground = UIColor(netHex: 0x44475a)
    
    static let inactiveText = UIColor(netHex: 0x8be9fd)
    static let notMonthText = UIColor(netHex: 0x6272a4)
    static let activeText = UIColor(netHex: 0x8be9fd)
    static let monthNameText = UIColor(netHex: 0x8be9fd)
    
    static let doneStroke = UIColor(netHex: 0x50fa7b)
    static let doneFill = UIColor(netHex: 0x50fa7b)
    static let doneText = UIColor(netHex: 0x282a36)
    
    static let notDoneStroke = UIColor(netHex: 0xff5555)
    static let notDoneFill = UIColor(netHex: 0xff5555)
    static let notDoneText = UIColor(netHex: 0x282a36)
    
}

