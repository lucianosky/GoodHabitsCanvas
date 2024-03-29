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
    case quartely // TODO: maybe keep maybe delete
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
    
    init?(habitResponse: HabitResponse) {
        guard let freq = Frequency(rawValue: habitResponse.frequency),
            let rep = Repetition(rawValue: habitResponse.repetition) else {
                print("Error in mocked habit id=\(habitResponse.id)")
                return nil
        }
        var ts = [Date]()
        for strTimestamp in habitResponse.timestamps {
            guard let date = habitResponse.trackTime ? Date.fromDateTimeString(strTimestamp) : Date.fromDateString(strTimestamp) else {
                print("Error in mocked habit timestamps id=\(habitResponse.id)")
                return nil
            }
            ts.append(date)
        }
        id = habitResponse.id
        description = habitResponse.description
        idObjective = habitResponse.idObjective
        frequency = freq
        repetition = rep
        trackTime = habitResponse.trackTime
        timestamps = ts
    }
    
    static func listFromResponse(_ response: [HabitResponse]) -> [Habit] {
        return response.compactMap(Habit.init)
    }

}

struct HabitResponse: Decodable {
    var id: Int
    var description: String
    var idObjective: Int
    var frequency: Int
    var repetition: Int
    var trackTime: Bool
    var timestamps: [String]
}
