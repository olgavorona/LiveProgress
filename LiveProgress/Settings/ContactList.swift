//
//  ContactList.swift
//  LiveProgress
//
//  Created by Olga Vorona on 18/02/2019.
//  Copyright © 2019 Olga Vorona. All rights reserved.
//

import UIKit

enum Contacts {
    static let email = ("Mail", "o-vorona@mail.ru")
    static let linkedIn = ("LinkedIn", "https://www.linkedin.com/in/ovorona/")
    static let instagram = ("Instagram","https://www.instagram.com/curlnomad/")
}

class ContactList: UIAlertController {
    static let titleString = "Write me"
    
    static func create() -> UIAlertController {
        let sheet =  UIAlertController.init(title: titleString,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        let mail = UIAlertAction(title: Contacts.email.0,
                                 style: .default) { _ in
                                    if let url = URL(string: "mail:\(Contacts.email.1)") {
                                        UIApplication.shared.open(url,
                                                                  completionHandler:nil)
                                    }
        }
        let linkedIn = UIAlertAction(title: Contacts.linkedIn.0,
                                     style: .default) { _ in
                                        if let url = URL(string: Contacts.linkedIn.1) {
                                            UIApplication.shared.open(url,
                                                                      completionHandler:nil)
                                        }
        }
        let instagram = UIAlertAction(title: Contacts.instagram.0,
                                      style: .default) { _ in
                                        if let url = URL(string: Contacts.instagram.1) {
                                            UIApplication.shared.open(url,
                                                                      completionHandler:nil)
                                        }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(mail)
        sheet.addAction(linkedIn)
        sheet.addAction(instagram)
        sheet.addAction(cancel)
        
        return sheet
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
