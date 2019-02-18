//
//  ViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 14/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, UITabBarDelegate, UITableViewDataSource {
   
    
    //MARK: Variables
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorColor = UIColor.clear
            tableView.estimatedRowHeight = 44.0
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    var viewModels: [ProgressViewModel] = []
   
    var timer: Timer?
    
    //MARK: View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateData()
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self,
                                     selector: #selector(MainViewController.updateData),
                                     userInfo: nil,
                                     repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        super.viewWillDisappear(animated)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc func updateData() {
        viewModels = [ProgressViewModel(type: .day),
                      ProgressViewModel(type: .month),
                      ProgressViewModel(type: .year)]
        tableView.reloadData()
    }
    
    
    //MARK: Table View

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier)
            as? ProgressCell {
            cell.setup(with: viewModel)
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK:- image screen share
    
    @IBAction func shareScreenshot(_ sender: Any) {
        if let img = screenshot() {
            let objectsToShare = [img] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareInst(_ sender: Any) {
        guard let img = screenshot()?.pngData() else { return }
        guard let urlScheme = URL(string: "instagram-stories://share"),
            UIApplication.shared.canOpenURL(urlScheme) else {
                return
        }
        let pasteboardItems = [["com.instagram.sharedSticker.backgroundImage": img]]
        let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
        UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
        UIApplication.shared.open(urlScheme)
    }
    
    func screenshot() -> UIImage? {
        let frame = CGRect(x: view.frame.origin.x,
                           y: view.frame.origin.y,
                           width: view.frame.size.width,
                           height: tableView.frame.height)
        UIGraphicsBeginImageContextWithOptions(frame.size, true, 0.0)
        view.drawHierarchy(in: view.frame, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

}

