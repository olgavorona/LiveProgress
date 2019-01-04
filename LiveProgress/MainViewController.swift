//
//  ViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 14/12/2018.
//  Copyright © 2018 Olga Vorona. All rights reserved.
//

import UIKit

class MainViewController: GradientViewController, UITabBarDelegate, UITableViewDataSource {
   
    //MARK: Variables
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorColor = UIColor.clear
            tableView.estimatedRowHeight = 44.0
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    var viewModels: [ProgressViewModel] = []
   
    //MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateData()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func updateData() {
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
    
    //MARK: Actions

    @IBAction func showSettings(_ sender: Any) {
        guard let vc = Router.shared.startVC() else { return }
        show(vc, sender: self)
    }
}

