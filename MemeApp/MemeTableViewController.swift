//
//  MemeTableViewController.swift
//  MemeApp
//
//  Created by Hernand Azevedo on 21/07/19.
//  Copyright © 2019 Hernand Azevedo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "tableViewCell"
private let showDetailSegueIdentifier = "showTableCellSegue"
private let showDetailCellHeight: CGFloat = 100.0
private let showDetailNumberOfSections = 1

class MemeTableViewController: UITableViewController {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return showDetailNumberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let currentMemeForIndex = appDelegate.memeList[indexPath.row]
        currentCell.imageView?.image = currentMemeForIndex.memedImage
        currentCell.textLabel?.text = currentMemeForIndex.topText + " - " + currentMemeForIndex.bottomText
        return currentCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSelectedMeme = appDelegate.memeList[indexPath.row]
        performSegue(withIdentifier: showDetailSegueIdentifier, sender: currentSelectedMeme)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showDetailSegueIdentifier {
            let memeDetailVC = segue.destination as! MemeDetailViewController
            let currentSelectedMeme = sender as! Meme
            memeDetailVC.hidesBottomBarWhenPushed = true
            memeDetailVC.selectedMeme = currentSelectedMeme
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return showDetailCellHeight
    }
}
