//
//  Objective.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

struct Objective {
    var id: Int
    var description: String
    var slice: WheelSlice
    var isValue: Bool
    
    init?(objectiveResponse: ObjectiveResponse) {
        guard let slic = WheelSlice(rawValue: objectiveResponse.slice) else {
                print("Error in mocked objective id=\(objectiveResponse.id)")
                return nil
        }
        id = objectiveResponse.id
        description = objectiveResponse.description
        slice = slic
        isValue = objectiveResponse.isValue
    }
    
    static func listFromResponse(_ response: [ObjectiveResponse]) -> [Objective] {
        return response.compactMap(Objective.init)
    }

}

struct ObjectiveResponse: Decodable {
    var id: Int
    var description: String
    var slice: Int
    var isValue: Bool
}
