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
        Repository.shared.loadFromAPIMock { (result) in
            switch(result) {
            case .success(_):
                break
            case .failure(let error):
                print(error)
            }
        }
    }


}

