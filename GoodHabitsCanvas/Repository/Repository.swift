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

class Repository {

    static let shared = Repository()
    
    private var localDatabase = LocalDatabase()
    
    private init() {}
    
    func loadFromAPIMock() {
        let url = "https://private-0934d-goodhabitscanvas.apiary-mock.com/objectives"
        let dataService = DataService()
        dataService.jsonRequest(url) { [weak self] (result: ServiceResult<[ObjectiveResponse]>) in
            switch(result) {
            case .success(let objectiveResponse):
                self?.localDatabase.objectives = Objective.listFromResponse(objectiveResponse.compactMap{$0})
                print("Loaded \(objectiveResponse.count) mock objectives")
            case .failure(let error):
                print("Error loading mock objectives: \(error)")
            }
        }
    }

}
