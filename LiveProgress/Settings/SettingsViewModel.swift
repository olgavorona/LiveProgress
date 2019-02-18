//
//  SettingsViewModel.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import Foundation

enum SettingsTypes: String {
    case notifications
    case date
    case image
    case developer
}

class SettingsViewModel: ViewModel {

    
    let reuseIdentifier: String = "SettingsCell"

    let type: SettingsTypes
    let title: String
    let showAttribute: Bool
    
    init(type: SettingsTypes,
         attribute: Bool = true) {
        self.type = type
        self.title = SettingsViewModel.title(for: type)
        self.showAttribute = attribute
    }
    
    static func title(for type: SettingsTypes) -> String {
        var result = ""
        switch type {
        case .notifications:
            result = "Notifications"
        case .date:
            result = "Change Birth date"
        case .image:
            result = "Pick a new background"
        case .developer:
            result = "Contact with Olga(developer)"

        }
        return result
    }
    
    enum Segues: String {
        case notifications
        case date
        case image
        case developer
    }

}
