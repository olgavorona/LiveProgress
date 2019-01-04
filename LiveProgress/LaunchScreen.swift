//
//  LaunchScreen.swift
//  LiveProgress
//
//  Created by Olga Vorona on 04/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let layer = GradientLayerColor.init(with: standardScheme.first, secondColor: standardScheme.last).layer {
            layer.frame = view.bounds
            view.layer.insertSublayer(layer, at: 0)
        }    }

}
