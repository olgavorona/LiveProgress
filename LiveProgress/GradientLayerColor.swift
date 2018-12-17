//
//  GradientLayerColor.swift
//  LiveProgress
//
//  Created by Olga Vorona on 15/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

class GradientLayerColor {
    let layer : CAGradientLayer!
    
    init(with firstColor: UIColor,
         secondColor: UIColor) {
        layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
    }
}
