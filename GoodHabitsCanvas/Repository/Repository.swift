//
//  Repository.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

private struct LocalDatabase {
    var objectives = [Objective]()
    var habits = [Habit]()
}

protocol RepositoryProtocol {
    func loadFromAPIMock(onCompleted: @escaping (ServiceResult<Bool>) -> Void)
    func getMonthHabitTracks(from: Date, to: Date) -> [HabitTrack]
}

class Repository: RepositoryProtocol {

    static let shared = Repository()
    
    private var localDatabase = LocalDatabase()
    
    private init() {}
    
    func loadFromAPIMock(onCompleted: @escaping (ServiceResult<Bool>) -> Void) {

        let dataService = DataService()
        let baseUrl = "https://private-0934d-goodhabitscanvas.apiary-mock.com"

        func loadHabits() {
            let urlHabits = "\(baseUrl)/habits"
            dataService.jsonRequest(urlHabits) { [weak self] (result: ServiceResult<[HabitResponse]>) in
                guard let self = self else { return }
                switch(result) {
                case .success(let habitsResponse):
                    self.localDatabase.habits = Habit.listFromResponse(habitsResponse.compactMap{$0})
                    for i in 0..<self.localDatabase.habits.count {
                        self.localDatabase.habits[i].objective = self.localDatabase.objectives.filter{$0.id == self.localDatabase.habits[i].idObjective}[0]
                        print(self.localDatabase.habits[i])
                    }
                    print("Loaded \(self.localDatabase.objectives.count) mock objectives; and \(self.localDatabase.habits.count) mock habits")
                    onCompleted(.success(true))
                case .failure(let error):
                    onCompleted(.failure(error))
                }
            }
        }
        
        let urlObjectives = "\(baseUrl)/objectives"
        dataService.jsonRequest(urlObjectives) { [weak self] (result: ServiceResult<[ObjectiveResponse]>) in
            switch(result) {
            case .success(let objectiveResponse):
                self?.localDatabase.objectives = Objective.listFromResponse(objectiveResponse.compactMap{$0})
                loadHabits()
            case .failure(let error):
                onCompleted(.failure(error))
            }
        }
    }
    
    func getMonthHabitTracks(from: Date, to: Date) -> [HabitTrack] {
        localDatabase.habits.forEach { (habit) in
            print(habit.description, habit.timestamps)
        }
        var filteredHabits = localDatabase.habits.map { (habit) -> Habit in
            var filteredHabit = habit
            filteredHabit.timestamps = filteredHabit.timestamps.filter({ (date) -> Bool in
                return date >= from && date <= to
            })
            return filteredHabit
        }
        filteredHabits = filteredHabits.filter{ $0.timestamps.count > 0 }
        var habitTracks = [HabitTrack]()
        filteredHabits.forEach { (habit) in
            habit.timestamps.forEach({ (date) in
                // TODO optional
                habitTracks.append(HabitTrack.init(description: habit.description, timestamp: date, slice: habit.objective!.slice))
            })
        }
        habitTracks.sort { $0 < $1 }
        return habitTracks
    }
    
}
