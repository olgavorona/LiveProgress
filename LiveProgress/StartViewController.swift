//
//  StartViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 17/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit
import TextFieldEffects

class StartViewController: UIViewController {

    @IBOutlet weak var plannedAge: HoshiTextField! {
        didSet {
            plannedAge.borderActiveColor = standardScheme.last
            plannedAge.borderInactiveColor = standardScheme.first
        }
    }
    @IBOutlet weak var birthDate: HoshiTextField! {
        didSet {
            birthDate.borderActiveColor = standardScheme.last
            birthDate.borderInactiveColor = standardScheme.first
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.backgroundColor = standardScheme.second
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layer = GradientLayerColor.init(with: standardScheme.first, secondColor: standardScheme.last).layer {
            layer.frame = view.bounds
            view.layer.insertSublayer(layer, at: 0)
        }
    }

}
