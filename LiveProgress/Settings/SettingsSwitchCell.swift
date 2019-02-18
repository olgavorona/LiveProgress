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
    weak var viewModel: SettingsSwitchViewModel?
    
    func setup(with viewModel: ViewModel) {
        if let viewModel = viewModel as? SettingsSwitchViewModel {
            self.viewModel = viewModel
            nameLabel.text = viewModel.title
            settingsSwitch.isOn = ProjectSettings.shared.notificationSettings(for: viewModel.type)
        }
    }
    
    @IBAction func changeSettings(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        ProjectSettings.shared.saveNotificationSettings(for: viewModel.type,
                                                        value: settingsSwitch.isOn)
    }
}
