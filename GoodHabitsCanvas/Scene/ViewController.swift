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
    }

    @IBAction func buttonTouched(_ sender: Any) {
        Repository.shared.loadFromAPIMock { (result) in
            switch(result) {
            case .success(_):
                print("Loading success")
                let m = MonthlyViewModel()
                m.getCurrentMonthHabitTracks(onCompleted: { (result) in
                    switch(result) {
                    case .success(_):
                        print("getCurrentMonthHabitTracks success")
                    case .failure(let error):
                        print(error.associatedMessage)
                    }
                })
            case .failure(let error):
                print("Loading error: \(error)")
            }
        }
    }
    
}

