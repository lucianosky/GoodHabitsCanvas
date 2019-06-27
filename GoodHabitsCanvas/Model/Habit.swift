//
//  Habit.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

enum Frequency {
    case daily
    case weekly
    case monthly
    case quartely // maybe keep maybe delete
    case yearly
}

enum Repetition {
    case single
    case multiple
}

struct Habit {
    var description: String
    var objective: Objective
    var frequency: Frequency
    var repetition: Repetition
    var trackTime: Bool
    var timestamps: [Date]
}
