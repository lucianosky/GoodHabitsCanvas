//
//  CanvasUseCase.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 28/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

class CanvasUseCase {
    
    private var repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol? = nil) {
        self.repository = repository ?? Repository.shared
    }
    
    func getMonthHabitTracks(month: Date) {
        let calMonth = CalMonth.init(date: month)
        print(calMonth)
        let habitTracks = repository.getMonthHabitTracks(from: calMonth.firstMonthDate, to: calMonth.lastMonthDate)
        habitTracks.forEach { (habitTrack) in
            print(habitTrack.description, habitTrack.timestamp, habitTrack.slice)
        }
    }
    
}
