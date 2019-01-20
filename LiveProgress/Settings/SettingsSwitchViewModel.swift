//
//  SettingsSwitchViewModel.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

public enum SwitchTypes {
    case day
    case roundMonth
    case roundYear
}

protocol ViewModel {
    var reuseIdentifier: String {
        get
    }
}

class SettingsSwitchViewModel: ViewModel {
    let reuseIdentifier: String = "SettingsSwitchCell"
    
    let title: String
    let type: SwitchTypes
    
    init(type: SwitchTypes) {
        self.title = SettingsSwitchViewModel.title(for: type)
        self.type = type
    }
    
    static func title(for type: SwitchTypes) -> String {
        var result = ""
        switch type {
        case .day:
            result = "Every day"
        case .roundMonth:
            result = "Every round month percents"
        case .roundYear:
            result = "Every round year percents"
        }
        return result
    }

}
