//
//  ProgressViewModel.swift
//  LiveProgress
//
//  Created by Olga Vorona on 14/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

enum ProgressType {
    case day
    case month
    case year
    case life
}

class ProgressViewModel {
    let reuseIdentifier = "ProgressCell"
    let type: ProgressType
    let title: String
    let progress: Double
    let unit: String
    let left: String
 
    let leftNumber: Int
    let todayUnit: String
    let dateString: String

    
    init(type: ProgressType) {
        self.type = type
        self.progress = ProgressViewModel.progress(for: type)
        self.unit = ProgressViewModel.unit(for: type)
        self.title = ProgressViewModel.title(for: type)
        self.left = ProgressViewModel.left(for: type)
        self.todayUnit = ProgressViewModel.todayUnit(for: type)
        self.leftNumber = ProgressViewModel.leftNumber(for: type)
        self.dateString = ProgressViewModel.dateString(for: type)
    }
    
    private static func progress(for type: ProgressType) -> Double {
        var progress: Double = 0
        switch type {
        case .day:
            progress = DateHelper.dayProgress()
        case .month:
            progress = DateHelper.monthProgress()
        case .year:
            progress = DateHelper.yearProgress()
        case .life:
            progress = DateHelper.lifeProgress()
        }
        return progress
    }
    
    private static func title(for type: ProgressType) -> String {
        var result = ""
        if let date = ProjectSettings.shared.birthDate {
        switch type {
        case .day:
            result = DateHelper.daySince(date: date)
        case .month:
            result = DateHelper.monthSince(date: date)
        case .year:
            result = DateHelper.yearSince(date: date)
        case .life:
            result = ""
            }
        }
        return result
    }
    
    private static func unit(for type: ProgressType) -> String {
        var result = "Progress"
        switch type {
        case .day:
            result = "Day"
        case .month:
            result = "Month"
        case .year:
            result = "Year"
        case .life:
            result = "Life"
        }
        return result
    }
    
    private static func todayUnit(for type: ProgressType) -> String {
        var result = "Progress"
        switch type {
        case .day:
            result = "minutes"
        case .month:
            result = "days"
        case .year:
            result = "days"
        case .life:
            result = "Life"
        }
        return result
    }
    
    private static func leftNumber(for type: ProgressType) -> Int {
        var left = 0
        switch type {
        case .day:
            left = DateHelper.dayLeft()
        case .month:
            left = DateHelper.monthLeft()
        case .year:
            left = DateHelper.yearLeft()
        case .life:
            left = DateHelper.lifeLeft()
        }
        return left
    }
    
    private static func left(for type: ProgressType) -> String {
        var left = ""
        switch type {
        case .day:
            left = "\(DateHelper.dayLeft()) minutes till tomorrow"
        case .month:
            left = "\(DateHelper.monthLeft()) days till " + DateHelper.nextMonth()
        case .year:
            left =  "\(DateHelper.yearLeft()) days till next year"
        case .life:
            left = "\(DateHelper.lifeLeft())"
        }
        return left
    }
        
    private static func dateString(for type: ProgressType) -> String {
        var date: String = ""
            switch type {
            case .day:
                date = DateHelper.currentDay()
            case .month:
                date = DateHelper.currentMonth()
            case .year:
                date = DateHelper.currentYear()
            case .life:
                date = ""
            }
        return date
    }
    
    
    
}
