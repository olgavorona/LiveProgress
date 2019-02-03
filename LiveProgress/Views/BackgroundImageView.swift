//
//  BackgroundImageView.swift
//  LiveProgress
//
//  Created by Olga Vorona on 16/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class BackgroundImageView: UIImageView {
    var backImage: UIImage? {
        return ProjectSettings.shared.getBGImage() ?? UIImage(named: "gradient")
    }
    override func awakeFromNib() {
        image = backImage
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = backImage
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.image = backImage
    }
    
    func update() {
        self.image = backImage
    }
}
