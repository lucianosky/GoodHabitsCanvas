//
//  ViewController.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 27/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://private-0934d-goodhabitscanvas.apiary-mock.com/objectives"
        let dataService = DataService()
        dataService.jsonRequest(url) { (result: ServiceResult<[ObjectiveResponse]>) in
            switch(result) {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
       
    }


}

