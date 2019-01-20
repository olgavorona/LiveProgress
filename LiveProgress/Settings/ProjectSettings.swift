//
//  ProjectSettings.swift
//  LiveProgress
//
//  Created by Olga Vorona on 17/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import Foundation

class ProjectSettings {
    static let shared = ProjectSettings()
    private let defaults = UserDefaults(suiteName: "group.progress.TodayExtension") ?? UserDefaults.standard
  
    var birthDate : Date? {
        set { defaults.set(newValue, forKey: "dateBirth") }
        get { return defaults.object(forKey: "dateBirth") as? Date }
    }
    
    var liveLong: Int? {
        set { defaults.set(newValue, forKey: "liveLong") }
        get { return defaults.integer(forKey: "liveLong") }
    }
    
    var firstOpen: Bool {
        set { defaults.set(newValue, forKey: "firstOpen") }
        get { return defaults.bool(forKey: "firstOpen") }
    }
    
    private init() {}
    
    func notificationSettings(for type: SwitchTypes) -> Bool {
        return true
    }
}
