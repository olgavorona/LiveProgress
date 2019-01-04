//
//  DateHelper.swift
//  LiveProgress
//
//  Created by Olga Vorona on 17/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import Foundation

class DateHelper {
    
    //MARK :- Variables
    static let calendar = Calendar.current
    
    //MARK :- Countable
    static func daySince(date: Date) -> String {
        let now = Date()
        let diffInDays = calendar.dateComponents([.day], from: date, to: now).day ?? 0
        return String(diffInDays) + ordinalSuffix(from: diffInDays) + " "
    }
    
    static func yearSince(date: Date) -> String {
        let now = Date()
        let diff = calendar.dateComponents([.year], from: date, to: now).year ?? 0
        return String(diff) + ordinalSuffix(from: diff) + " "
    }
    
    static func monthSince(date: Date) -> String {
        let now = Date()
        let diff = calendar.dateComponents([.month], from: date, to: now).month ?? 0
        return String(diff) + ordinalSuffix(from: diff) + " "
    }
    
    //MARK :- Progress
    static func monthProgress() -> Double {
        let now = Date()
        let currentDay = calendar.component(.day, from: now)
        let result = Double(currentDay) / Double(daysInMonth())
        return 100 * result
    }
    
    static func yearProgress() -> Double {
        let result = Double(currentDay()) / Double(365)
        return 100 * result
    }
    
    static func dayProgress() -> Double {
        let result = currentSecond() / Double(60 * 60 * 24)

        return 100 * result
    }
    
    static func lifeProgress() -> Double {
        return 0
    }
    
    //MARK :- Left
    static func dayLeft() -> String {
        let minutesLeft = Int((Double(60 * 60 * 24) - currentSecond()) / 60)
        return String(minutesLeft) + " minutes till tomorrow"
    }
    
    static func yearLeft() -> String {
        let result = 365 - currentDay()
        return String(result) + " days till next year"
    }
    
    static func monthLeft() -> String {
        let now = Date()
        let currentDay = calendar.component(.day, from: now)
        let left = daysInMonth() - currentDay
        return String(left) + " days till February"
    }
    
    static func lifeLeft() -> String {
        return "one life left"
    }

    //MARK :- Formatter

    static let birthDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        return dateFormatter
    }()
    
    //MARK :- Helper

    static func dateFromNow(years: Int) -> Date {
       return calendar.date(byAdding: .year, value: years, to: Date()) ?? Date()
    }
    
    private static func currentDay() -> Int {
        let now = Date()
        let startYear = calendar.date(from: calendar.dateComponents([.year], from: now))
        let diffInDays = calendar.dateComponents([.day], from: startYear ?? now, to: now).day ?? 0
        return diffInDays
    }
    
    private static func daysInMonth() -> Int {
        let now = Date()
        let startMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: now)) ?? now
        let endMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startMonth) ?? now
        let daysCount = calendar.component(.day, from: endMonth)
        return daysCount
    }
    
    private static func currentSecond() -> Double {
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let seconds = now.timeIntervalSince(startOfDay)
        return seconds
    }
    
    private static func ordinalSuffix(from count: Int) -> String {
        let end = count % 10
        switch end {
        case 1: return "st"
        case 2: return "nd"
        case 3: return "rd"
        default: return "th"
        }
    }
}
