//
//  TabBarViewController.swift
//  MemeApp
//
//  Created by Hernand Azevedo on 21/07/19.
//  Copyright © 2019 Hernand Azevedo. All rights reserved.
//

import UIKit

class TabBarViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(navigateToMemeEditor))
    }
    @objc func navigateToMemeEditor() {
        
    }
}
