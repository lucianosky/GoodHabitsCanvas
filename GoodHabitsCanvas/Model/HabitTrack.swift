//
//  HabitTrack.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

struct HabitTrack {
    var description: String
    var timestamp: Date
    var slice: WheelSlice
}

extension HabitTrack: Comparable {

    static func < (lhs: HabitTrack, rhs: HabitTrack) -> Bool {
        return lhs.timestamp < rhs.timestamp
    }
    
}
