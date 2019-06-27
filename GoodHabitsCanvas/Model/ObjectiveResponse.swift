//
//  ObjectiveResponse.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

struct ObjectiveResponse: Decodable {
    var description: String
    var slice: Int
    var isValue: Bool
}
