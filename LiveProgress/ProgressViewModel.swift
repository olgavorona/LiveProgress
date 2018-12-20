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
    
    init(type: ProgressType) {
        self.type = type
        self.progress = ProgressViewModel.progress(for: type)
        self.unit = ProgressViewModel.unit(for: type)
        self.title = ProgressViewModel.title(for: type)

    }
    
    private static func title(for type: ProgressType) -> String {
        var result = ""
        let date = ProjectSettings.shared.birthDate
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
        
    private static func progress(for type: ProgressType) -> Double {
        var progress: Double = 0
            switch type {
            case .day:
                progress = 15.2
            case .month:
                progress = 59
            case .year:
                progress = 14
            case .life:
                progress = 27
            }
        return progress
    }
    
    
}
