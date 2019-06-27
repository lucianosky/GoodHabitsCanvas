//
//  Objective.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

struct Objective {
    var description: String
    var slice: WheelSlice
    var isValue: Bool
    
    init(objectiveResponse: ObjectiveResponse) {
        description = objectiveResponse.description
        slice = WheelSlice(rawValue: objectiveResponse.slice)!
        isValue = objectiveResponse.isValue
    }
    
    static func listFromResponse(_ response: [ObjectiveResponse]) -> [Objective] {
        return response.map(Objective.init)
    }

}
