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
    var birthDate = Date(timeIntervalSince1970: 718675200)
    private init() {}
}
