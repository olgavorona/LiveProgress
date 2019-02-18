//
//  ProjectSettings.swift
//  LiveProgress
//
//  Created by Olga Vorona on 17/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

class ProjectSettings {
    static let shared = ProjectSettings()
    private let defaults = UserDefaults(suiteName: "group.progress.TodayExtension") ?? UserDefaults.standard
  
    //MARK:- variables
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
    
    //MARK:- notification
    func notificationSettings(for type: SwitchTypes) -> Bool {
        return defaults.bool(forKey: type.rawValue)
    }
    
    func saveNotificationSettings(for type: SwitchTypes,
                                  value: Bool)  {
         defaults.set(value, forKey: type.rawValue)
        ScheduleNotificationHelper.schedule(type: type)
    }
    
    //MARK:- image
    private let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    private let fileName = "image.jpg"

    func saveBGImage(image: UIImage) {
        guard let directory = directory else { return }
        let fileURL = directory.appendingPathComponent(fileName)
        if let data = image.jpegData(compressionQuality: 1.0) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
    }
    
    func getBGImage() -> UIImage? {
        guard let directory = directory else { return nil }
            let imageURL = directory.appendingPathComponent(fileName)
            let image    = UIImage(contentsOfFile: imageURL.path)
            return image
    }
}
