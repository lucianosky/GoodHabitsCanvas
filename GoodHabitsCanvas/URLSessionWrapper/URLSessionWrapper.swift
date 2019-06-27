//
//  URLSessionWrapper.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

class URLSessionWrapper: URLSessionWrappperProtocol {
    
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        return URLSession.shared.dataTask(with: url){ (data, response, error) in
            completionHandler(data, response, error)
        }
    }
    
}
