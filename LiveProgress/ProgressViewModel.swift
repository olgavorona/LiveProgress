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
    let color: GradientLayerColor
    let type: ProgressType
    let title: String
    let progress: Double
    
    init(type: ProgressType) {
        self.type = type
        self.color = ProgressViewModel.color(for: type)
        self.progress = ProgressViewModel.progress(for: type)
        self.title = ProgressViewModel.title(for: type)
    }
    
    private static func color(for type: ProgressType) -> GradientLayerColor {
        var result = GradientLayerColor(with: UIColor.black, secondColor: UIColor.white)
        switch type {
        case .day:
            result = GradientLayerColor(with: standardScheme.first, secondColor: standardScheme.second)
        case .month:
            result = GradientLayerColor(with: standardScheme.second, secondColor: standardScheme.third)
        case .year:
            result = GradientLayerColor(with: standardScheme.third, secondColor: standardScheme.forth)
        case .life:
            result = GradientLayerColor(with: standardScheme.forth, secondColor: standardScheme.last)
        }
        return result
    }
    
    private static func title(for type: ProgressType) -> String {
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
