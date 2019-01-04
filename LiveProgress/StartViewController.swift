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
  
    //MARK:- Variables

    
    private let MinYears = -100
    private let MaxYears = -10
    
    private let firstOpen = ProjectSettings.shared.firstOpen
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            if !firstOpen {
            titleLabel.text = "App will customize progress for you "
            } else {
            titleLabel.text = "Please select birth date"
            }
        }
    }
    
    @IBOutlet weak var skipButton: UIButton! {
        didSet {
            if !firstOpen {
                skipButton.setTitle("Cancel", for: .normal)
            } else {
                skipButton.setTitle("Skip", for: .normal)
            }
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
            if !firstOpen {
                nextButton.setTitle("Watch your progress", for: .normal)
            } else {
                nextButton.setTitle("Save", for: .normal)
            }
        }
    }
   
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.minimumDate = DateHelper.dateFromNow(years: MinYears)
            datePicker.maximumDate = DateHelper.dateFromNow(years: MaxYears)
        }
    }
    
    //MARK:- ViewController

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
    
    //MARK:- Actions

    @IBAction func dateChanged(_ sender: UIDatePicker) {
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        let selectedDate = sender.date
        birthDate.text = DateHelper.birthDateFormatter.string(from: selectedDate)
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        ProjectSettings.shared.birthDate = datePicker.date
        goToMain()
    }
    
    @IBAction func cancelChanges(_ sender: Any) {
        goToMain()
    }
    
    func goToMain() {
        if firstOpen {
            dismiss(animated: true, completion: nil)
        } else {
            ProjectSettings.shared.firstOpen = true
            performSegue(withIdentifier: "main", sender: self)
        }
    }
}
