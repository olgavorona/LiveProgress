//
//  SettingsViewModel.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import Foundation

class SettingsViewModel: ViewModel {
    let reuseIdentifier: String = "SettingsCell"

    let title: String
    let segue: String
    let showAttribute: Bool
    
    init(title: String,
         segue: String,
         attribute: Bool = true) {
        self.title = title
        self.segue = segue
        self.showAttribute = attribute
    }
}
