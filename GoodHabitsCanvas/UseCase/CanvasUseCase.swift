//
//  CanvasUseCase.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 28/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

protocol CanvasUseCaseProtocol {
    func getCurrentMonthHabitTracks(onCompleted: @escaping (ServiceResult<[HabitTrack]>) -> Void)
    var calMonth: CalMonth { get }
}

class CanvasUseCase: CanvasUseCaseProtocol {
    
    private var repository: RepositoryProtocol
    private(set) var calMonth: CalMonth
    
    init(repository: RepositoryProtocol? = nil) {
        self.repository = repository ?? Repository.shared
        //calMonth = CalMonth.init(date: Date())
        calMonth = CalMonth.init(date: Date(), startOfWeek: 2)
    }
    
    func getCurrentMonthHabitTracks(onCompleted: @escaping (ServiceResult<[HabitTrack]>) -> Void) {
        repository.getMonthHabitTracks(from: calMonth.firstMonthDate, to: calMonth.lastMonthDate) { (result) in
            onCompleted(result)
        }
    }
    
}
