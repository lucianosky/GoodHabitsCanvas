//
//  MonthlyViewController.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 30/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation
import UIKit

// TODO
class BaseViewController: UIViewController {
}

private struct Consts {
    static let title = "Monthly View"
    static let tableCellId = "weekCell"
}

class MonthlyViewController: BaseViewController {
    
    var viewModel: MonthlyViewModelProtocol
    
    let tableView = UITableView(.white, 50, false)
    
    init(viewModel: MonthlyViewModelProtocol? = nil) {
        self.viewModel = viewModel ?? MonthlyViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#file) \(#function) not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        createConstraints()
        initialLoad()
    }
    
    private func createSubviews() {
        title = Consts.title
        view.backgroundColor = .white
        //tableView.register(DragonTableViewCell.self, forCellReuseIdentifier: Consts.tableCellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Consts.tableCellId)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func createConstraints() {
        let dict: [String: Any] = [
            "tbl": tableView,
        ]
        activateConstraints("V:|[tbl]|", views: dict)
        activateConstraints("H:|[tbl]|", views: dict)
    }
    
    private func initialLoad() {
        Repository.shared.loadFromAPIMock { [weak self] (result) in
            switch(result) {
            case .success(_):
                print("Loading success")
                self?.getCurrentMonthHabitTracks()
            case .failure(let error):
                print("Loading error: \(error)")
            }
        }
    }
    
    private func getCurrentMonthHabitTracks() {
        viewModel.getCurrentMonthHabitTracks { [weak self] (result) in
            switch(result) {
            case .success(_):
                break
            case .failure(let error):
                print("error \(error)")
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension MonthlyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.calMonth.getWeeks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Consts.tableCellId, for: IndexPath(row: indexPath.row, section: 0)) as? UITableViewCell
            else { return UITableViewCell() }
        let calWeek = self.viewModel.calMonth.getWeeks()[indexPath.row]
        cell.textLabel?.text = calWeek.days.reduce("", { (result, calDay) -> String in
            return result + " " + calDay.text
        })
        return cell
        
    }
    
}
