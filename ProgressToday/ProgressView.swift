//
//  ProgressView.swift
//  ProgressToday
//
//  Created by Olga Vorona on 07/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    @IBOutlet weak var progressView: CircularProgressBar! {
        didSet {
            progressView.trackColor = standardScheme.third.withAlphaComponent(0.7)
            progressView.barColor = standardScheme.third.withAlphaComponent(0.3)
            progressView.lineWidth = 8.0
        }
    }
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    func setup(with viewModel: ProgressViewModel) {
        progressView.progress =  viewModel.progress
        leftLabel.text = String(viewModel.leftNumber)
        unitLabel.text = viewModel.todayUnit
        dateLabel.text = viewModel.dateString
    }
}
