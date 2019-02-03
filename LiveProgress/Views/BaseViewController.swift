//
//  BaseViewController.swift
//  LiveProgress
//
//  Created by Olga Vorona on 03/02/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    @IBOutlet weak var backgroundImage: BackgroundImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(_:animated)
        backgroundImage?.update()
    }


}
