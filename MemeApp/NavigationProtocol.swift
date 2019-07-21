//
//  NavigationProtocol.swift
//  MemeApp
//
//  Created by Hernand Azevedo on 21/07/19.
//  Copyright © 2019 Hernand Azevedo. All rights reserved.
//

import UIKit

protocol DetailsNavigationProtocol {
     func prepareDetailSegue(_ segue: UIStoryboardSegue, _ sender: Any?)
}

extension DetailsNavigationProtocol {
    func prepareDetailSegue(_ segue: UIStoryboardSegue, _ sender: Any?) {
        let memeDetailVC = segue.destination as! MemeDetailViewController
        let currentSelectedMeme = sender as! Meme
        memeDetailVC.hidesBottomBarWhenPushed = true
        memeDetailVC.selectedMeme = currentSelectedMeme
    }
}
