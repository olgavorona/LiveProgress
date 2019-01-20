//
//  BackgroundImageView.swift
//  LiveProgress
//
//  Created by Olga Vorona on 16/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class BackgroundImageView: UIImageView {
    
    override func awakeFromNib() {
        image = UIImage(named: "gradient")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "gradient")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.image = UIImage(named: "gradient")
    }
}
