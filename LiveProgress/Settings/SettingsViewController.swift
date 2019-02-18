//
//  SettingsViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 19/01/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    var viewModels: [ViewModel] {
        get {
            return isNotifications ? notificationViewModels : settingsViewModels
        }
    }
    
    let settingsViewModels: [ViewModel] = [SettingsViewModel(type: .notifications),
                                           SettingsViewModel(type: .date),
                                           SettingsViewModel(type: .image),
                                           SettingsViewModel(type: .developer,
                                                             attribute: false)
    ]
    
    let notificationViewModels: [ViewModel] = [SettingsSwitchViewModel(type: SwitchTypes.day),
                                               SettingsSwitchViewModel(type: SwitchTypes.roundMonth),
                                               SettingsSwitchViewModel(type: SwitchTypes.roundYear)]
    
    
    var isNotifications = false
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorColor = UIColor.clear
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = 100
        }
    }
    
    let sheet = ContactList.create()
    
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
            switch viewModel.type {
            case .notifications:
                if let vc = Router.shared.settingsVC() {
                    vc.isNotifications = true
                    self.show(vc, sender: self)
                }
                
            case .date:
                performSegue(withIdentifier: viewModel.type.rawValue, sender: self)
            case .image:
                photoLibrary()
            case .developer:
                contactList()
            }
        }
    }
    
    func contactList() {
        present(sheet, animated: true, completion: nil)
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
            print("Something went wrong in image")
        }
      dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
