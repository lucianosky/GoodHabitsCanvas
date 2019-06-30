//
//  DateExtension.swift
//  GoodHabitsCanvas
//
//  Created by Luciano Sclovsky on 28/06/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

extension Date {
    
    private static func yearMonthDay(_ yyyymmdd: String) -> (Int, Int, Int)? {
        guard
            let strYear = yyyymmdd[0...3],
            let year = Int(strYear),
            let strMonth = yyyymmdd[4...5],
            let month = Int(strMonth),
            let strDay = yyyymmdd[6...7],
            let day = Int(strDay)
        else {
            return nil
        }
        return (year, month, day)
    }

    private static func hourMin(_ hhmm: String) -> (Int, Int)? {
        guard
            let strHour = hhmm[0...1],
            let hour = Int(strHour),
            let strMin = hhmm[2...3],
            let min = Int(strMin)
            else {
                return nil
        }
        return (hour, min)
    }
    
    static func fromComponents(_ year: Int, _ month: Int, _ day: Int = 1, _ hour: Int = 0, _ min: Int = 0) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = min
        dateComponents.second = 0
        return Calendar.current.date(from: dateComponents)
    }

    static func fromDateTimeString(_ dateTimeStr: String) -> Date? {
        let strComponents = dateTimeStr.components(separatedBy: ".")
        guard
            strComponents.count > 1,
            let (year, month, day) = yearMonthDay(strComponents[0]),
            let (hour, min) = hourMin(strComponents[1])
        else {
            return nil
        }
        return Date.fromComponents(year, month, day, hour, min)
    }

    static func fromDateString(_ dateStr: String) -> Date? {
        guard
            let (year, month, day) = yearMonthDay(dateStr)
            else {
                return nil
        }
        return Date.fromComponents(year, month, day, 0, 0)
    }

}
