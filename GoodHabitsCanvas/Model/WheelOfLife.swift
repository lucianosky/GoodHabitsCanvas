//
//  WheelOfLife.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

enum WheelQuadrant {
    case personal
    case professional
    case relationship
    case qualityOfLife
}

enum WheelSlice: Int {
    case healthAndDisposition
    case intellectualDevelopmemt
    case emotionalBalance
    case achievementAndPurpose
    case finantialResources
    case socialContribution
    case family
    case loveRelationship
    case socialLife
    case creativityFunAndHobbies
    case fullnessAndHappiness
    case spirituality
    
    var quadrant: WheelQuadrant {
        switch self {
        case .healthAndDisposition, .intellectualDevelopmemt, .emotionalBalance: return .personal
        case .achievementAndPurpose, .finantialResources, .socialContribution: return .professional
        case .family, .loveRelationship, .socialLife: return .relationship
        case .creativityFunAndHobbies, .fullnessAndHappiness, .spirituality: return .qualityOfLife
        }
    }
}

