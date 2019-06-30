//
//  MonthlyViewModel.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 30/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

protocol MonthlyViewModelProtocol {
    func getCurrentMonthHabitTracks(onCompleted: @escaping (ServiceResult<Bool>) -> Void)
}

class MonthlyViewModel: MonthlyViewModelProtocol {
    
    private var canvasUseCase: CanvasUseCaseProtocol
    private var habitTracks = [HabitTrack]()
    
    init(canvasUseCase: CanvasUseCaseProtocol? = nil) {
        self.canvasUseCase = canvasUseCase ?? CanvasUseCase()
    }
    
    func getCurrentMonthHabitTracks(onCompleted: @escaping (ServiceResult<Bool>) -> Void) {
        canvasUseCase.getCurrentMonthHabitTracks { [weak self](result) in
            switch(result) {
            case .success(let habitTracks):
                self?.habitTracks = habitTracks
                onCompleted(.success(true))
                habitTracks.forEach { (habitTrack) in
                    print(habitTrack.description, habitTrack.timestamp, habitTrack.slice)
                }
            case .failure(let error):
                print(error)
                onCompleted(.failure(error))
            }
        }
    }

    
}
