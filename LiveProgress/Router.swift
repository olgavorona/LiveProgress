//
//  Router.swift
//  LiveProgress
//
//  Created by Olga Vorona on 04/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class Router {
    static let shared = Router()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func startVC() -> StartViewController? {
        return storyboard.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController
    }
    
    func mainVC() -> MainViewController? {
        return storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
    }
}
