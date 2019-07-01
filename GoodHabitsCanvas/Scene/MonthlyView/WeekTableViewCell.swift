//
//  WeekTableViewCell.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 01/07/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {
    
    let stack = UIStackView(.horizontal)
    var dayViews = [DayView]()
    //weak var monthViewController: MonthViewController?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#file) \(#function) not implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        for i in 0...6 {
            let dayView = DayView()
            dayView.text = "\(i)"
            dayView.tag = i+1

            // TODO: long press animation
            
//            dayView.rx
//                .longPressGesture()
//                .when(.began, .ended)
//                .subscribe(onNext: { [weak self] gesture in
//                    guard let self = self, let monthVC = self.monthViewController else {
//                        FirebaseHelper.shared.warning(theClass: WeekTableViewCell.typeName, unexpectedNullValue: "subscribe dayView")
//                        return
//                    }
//                    if gesture.state == .began {
//                        dayView.shrink = true
//                    } else {
//                        dayView.shrink = false
//                        if dayView.isHeader {
//                            monthVC.changeStartOfWeek(tag: dayView.tag)
//                        } else {
//                            if let date = dayView.date {
//                                FirebaseHelper.shared.logEvent(event: "MONTH_VIEW_DAY", parameters: ["DATE": date.yyyymmdd])
//                                monthVC.changeHabitState(date: date)
//                            } // not fromMonth days won't have dates
//                        }
//                    }
//                })
//                .disposed(by: self.disposeBag)
            
            stack.addArrangedSubview(dayView)
            dayViews.append(dayView)
        }
        contentView.addSubview(stack)
        contentView.backgroundColor = .background
        
        let viewsDict = [
            "stack" : stack,
        ]
        
        contentView.activateConstraints("V:|[stack]|", views: viewsDict)
        contentView.activateConstraints("H:|[stack]|", views: viewsDict)
    }
    
    //     TODO: review
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        disposeBag = DisposeBag()
    //    }
    
    func configure(from calWeek: CalWeek) -> WeekTableViewCell {
        
        // TODO - review
        //        if calWeek.isHeader {
        //            backgroundColor = .backgroundXXX
        //        }
        
       // self.monthViewController = monthViewController
        for tag in 0...6 {
            if let dayView = viewWithTag(tag+1) as? DayView {
                let calDay = calWeek.days[tag]
                dayView.text = calDay.text
                dayView.active = calDay.fromMonth
                // TODO - review state
                dayView.habitState = .none
//                if let date = calDay.date, calDay.fromMonth {
//                    // dayView.habitState = monthViewController.viewModel.getHabitState(date: date)
//                    dayView.habitState = .done
//                } else {
//                    dayView.habitState = .none
//                }
                dayView.date = calWeek.days[tag].date
                dayView.isHeader = calWeek.isHeader
            }
        }
        return self
    }
    
    func changeState(date: Date, habitState: HabitState) -> Bool {
        for dayView in dayViews {
            if dayView.active, let dayDate = dayView.date, dayDate == date {
                dayView.habitState = habitState
                return true
            }
        }
        return false
    }
    
}

extension WeekTableViewCell : NameDescribable {}
