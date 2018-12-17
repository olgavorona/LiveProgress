//
//  ProgressCell.swift
//  LiveProgress
//
//  Created by Olga Vorona on 14/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

class ProgressCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    
    func setup(with viewModel: ProgressViewModel) {
//        if let backgroundLayer = viewModel.color.layer {
//            backgroundLayer.frame = backView.bounds
//            backView.layer.insertSublayer(backgroundLayer, at: 0)
//        }
        titleLabel.text = viewModel.title
        progressLabel.text = String(viewModel.progress) + " %"
    }


}
