//
//  AppDelegate.swift
//  LiveProgress
//
//  Created by Olga Vorona on 14/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setWindow()
        return true
    }
    
    func setWindow() {
        var resultVC = UIViewController()
        if ProjectSettings.shared.firstOpen {
            resultVC = Router.shared.mainVC() ?? UIViewController()
        } else {
            resultVC = Router.shared.startVC() ?? UIViewController()
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = resultVC
        window?.makeKeyAndVisible()
    }


}

