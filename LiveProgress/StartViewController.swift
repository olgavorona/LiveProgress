//
//  StartViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 17/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit
import TextFieldEffects


final class StartViewController: UIViewController {
  
    private enum Segues: String {
        case skip
        case save
    }
    
    private let MinYears = -100
    private let MaxYears = -10
    
    @IBOutlet weak var birthDate: HoshiTextField! {
        didSet {
            birthDate.borderActiveColor = standardScheme.last
            birthDate.borderInactiveColor = standardScheme.first
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.backgroundColor = standardScheme.second
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.minimumDate = DateHelper.dateFromNow(years: MinYears)
            datePicker.maximumDate = DateHelper.dateFromNow(years: MaxYears)
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = ProjectSettings.shared.birthDate {
            birthDate.text = DateHelper.birthDateFormatter.string(from: date)
            datePicker.date = date
            datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        }
        if let layer = GradientLayerColor.init(with: standardScheme.first, secondColor: standardScheme.last).layer {
            layer.frame = view.bounds
            view.layer.insertSublayer(layer, at: 0)
        }
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        nextButton.isEnabled = true
        let selectedDate = sender.date
        birthDate.text = DateHelper.birthDateFormatter.string(from: selectedDate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segue = Segues(rawValue: segue.identifier ?? "") else { return }
        ProjectSettings.shared.firstOpen = true
        switch segue {
        case .skip:
            break
        case .save:
            ProjectSettings.shared.birthDate = datePicker.date
        }
    }
    
}
