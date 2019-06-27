//
//  DataServiceProtocol.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
    
    func jsonRequest<T: Decodable> (
        _ urlString: String,
        onCompleted: @escaping (ServiceResult<T>) -> Void)
    
    func request (
        _ urlString: String,
        onCompleted: @escaping (ServiceResult<Data>) -> Void)
    
}
