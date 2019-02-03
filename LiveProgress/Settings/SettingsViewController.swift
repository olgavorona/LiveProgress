//
//  SettingsViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    enum Segues: String {
        case notifications
        case date
        case image
    }
    
    enum Titles: String {
        case notifications = "Notifications"
        case date = "Change Birth date"
        case image = "Pick a new background"
    }
    
    var viewModels: [ViewModel] {
        get {
            return isNotifications ? notificationViewModels : settingsViewModels
        }
    }
    
    let settingsViewModels: [ViewModel] = [SettingsViewModel(title: Titles.notifications.rawValue,
                                                             segue: Segues.notifications.rawValue),
                                           SettingsViewModel(title: Titles.date.rawValue,
                                                             segue: Segues.date.rawValue),
                                           SettingsViewModel(title: Titles.image.rawValue,
                                                             segue: Segues.image.rawValue)
    ]
    
    let notificationViewModels: [ViewModel] = [SettingsSwitchViewModel(type: SwitchTypes.day),
                                               SettingsSwitchViewModel(type: SwitchTypes.roundMonth),
                                               SettingsSwitchViewModel(type: SwitchTypes.roundYear)]
    
    
    var isNotifications = false
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorColor = UIColor.clear
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = 100//UITableView.automaticDimension
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isNotifications {
            let barButton = UIBarButtonItem(barButtonSystemItem: .stop,
                                            target: self,
                                            action: #selector(dismiss(_:)))
            navigationItem.leftBarButtonItem = barButton
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SettingsViewController {
            destination.isNotifications = true
        }
    }
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier)
        if let cell = cell as? ViewModelCell {
            cell.setup(with: viewModel)
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewModel = viewModels[indexPath.row] as? SettingsViewModel {
            if viewModel.segue == Segues.notifications.rawValue,
                let vc = Router.shared.settingsVC(){
                vc.isNotifications = true
                self.show(vc, sender: self)
            } else if viewModel.segue == Segues.date.rawValue {
                performSegue(withIdentifier: viewModel.segue, sender: self)
            } else if viewModel.segue == Segues.image.rawValue {
                photoLibrary()
            }
        }
    }
    
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            present(myPickerController, animated: true, completion: nil)
        }
    }
    
    
}

extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ProjectSettings.shared.saveBGImage(image: image)
        } else{
            print("Something went wrong in  image")
        }
      dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
