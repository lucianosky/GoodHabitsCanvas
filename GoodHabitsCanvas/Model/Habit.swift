//
//  Habit.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

enum Frequency: Int {
    case daily
    case weekly
    case monthly
    case quartely // maybe keep maybe delete
    case yearly
}

enum Repetition: Int {
    case single
    case multiple
}

struct Habit {
    var id: Int
    var description: String
    let idObjective: Int
    var objective: Objective?
    var frequency: Frequency
    var repetition: Repetition
    var trackTime: Bool
    var timestamps: [Date]
    
    init(habitResponse: HabitResponse) {
        id = habitResponse.id
        description = habitResponse.description
        idObjective = habitResponse.idObjective
        frequency = Frequency(rawValue: habitResponse.frequency)!
        repetition = Repetition(rawValue: habitResponse.repetition)!
        trackTime = habitResponse.trackTime
        timestamps = [Date]()
    }
    
    static func listFromResponse(_ response: [HabitResponse]) -> [Habit] {
        return response.map(Habit.init)
    }

}

struct HabitResponse: Decodable {
    var id: Int
    var description: String
    var idObjective: Int
    var frequency: Int
    var repetition: Int
    var trackTime: Bool
}
