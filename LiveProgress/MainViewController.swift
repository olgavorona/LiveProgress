//
//  ViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 14/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var viewModels: [ProgressViewModel] = [ProgressViewModel(type: .day),
                                           ProgressViewModel(type: .month),
                                           ProgressViewModel(type: .year)]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        tableView.separatorColor = UIColor.clear
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
        if let layer = GradientLayerColor.init(with: standardScheme.first, secondColor: standardScheme.last).layer {
            layer.frame = view.bounds
            view.layer.insertSublayer(layer, at: 0)
        }
    }
    
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

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

