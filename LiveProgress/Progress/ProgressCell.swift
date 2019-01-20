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
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var progressView: LinearProgressBar! {
        didSet {
            progressView.barColor = standardScheme.third.withAlphaComponent(0.6)
            progressView.trackColor = standardScheme.third.withAlphaComponent(0.2)
            progressView.barThickness = 40.0
        }
    }
    
    func setup(with viewModel: ProgressViewModel) {
        titleLabel.text = viewModel.title
        unitLabel.text = viewModel.unit
        leftLabel.text = viewModel.left
        if viewModel.progress == 0 {
            progressLabel.isHidden = true
        } else {
            progressLabel.isHidden = false
            progressLabel.text = String(format: "%.1f", viewModel.progress) + " %"
        }
        progressView.progressValue = CGFloat(viewModel.progress)
    }


}
