//
//  ServiceResult.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

public enum ServiceResult<Value> {
    case success(Value)
    case failure(Error)
}
