//
//  SettingsCell.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

protocol ViewModelCell {
    func setup(with viewModel: ViewModel)
}

class SettingsCell: UITableViewCell, ViewModelCell{
    @IBOutlet weak var nameLabel: UILabel!
    
    func setup(with viewModel: ViewModel) {
        if let viewModel = viewModel as? SettingsViewModel {
            nameLabel.text = viewModel.title
            if !viewModel.showAttribute {
                accessoryType = .none
            }
        }
    }

    
}
