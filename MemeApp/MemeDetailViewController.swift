//
//  MemeDetailViewController.swift
//  MemeApp
//
//  Created by Hernand Azevedo on 21/07/19.
//  Copyright © 2019 Hernand Azevedo. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    var selectedMeme: Meme?
    
    @IBOutlet weak var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedMeme = self.selectedMeme else {
            imageNotShown()
            return
        }

        detailImageView.image = selectedMeme.memedImage
    }
    
    func imageNotShown() {
        let alert = UIAlertController(title: "Select an Image", message: "Meme could not be shown because you did not select an image.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
