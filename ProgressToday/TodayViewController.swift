//
//  TodayViewController.swift
//  ProgressToday
//
//  Created by Olga Vorona on 07/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
   
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    func setupViews() {
        stackView.removeAllSubviews()

        let day : ProgressView  = ProgressView.fromNib()
        day.setup(with: ProgressViewModel(type: .day))
        stackView.addArrangedSubview(day)
        let month : ProgressView  = ProgressView.fromNib()
        month.setup(with: ProgressViewModel(type: .month))
        stackView.addArrangedSubview(month)
        let year : ProgressView  = ProgressView.fromNib()
        year.setup(with: ProgressViewModel(type: .year))
        stackView.addArrangedSubview(year)
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        setupViews()
        completionHandler(NCUpdateResult.newData)
    }
    
}
