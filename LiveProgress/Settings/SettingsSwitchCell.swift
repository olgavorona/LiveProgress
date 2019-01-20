//
//  SettingsSwitchCell.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class SettingsSwitchCell: UITableViewCell, ViewModelCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    func setup(with viewModel: ViewModel) {
        if let viewModel = viewModel as? SettingsSwitchViewModel {
            nameLabel.text = viewModel.title
 
        }
    }
}
