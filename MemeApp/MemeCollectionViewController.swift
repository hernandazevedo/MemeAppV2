//
//  MemeCollectionViewController.swift
//  MemeApp
//
//  Created by Hernand Azevedo on 21/07/19.
//  Copyright © 2019 Hernand Azevedo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionViewCell"
private let showDetailSegueIdentifier = "showCollectionCellSegue"
private let cellSpacing: CGFloat = 3.0
class MemeCollectionViewController: UICollectionViewController {
    var memeList: [Meme]! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memeList
    }

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlowLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memeList.count
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setupFlowLayout()
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        let currentMeme = memeList[indexPath.row]
        currentCell.memeCellImageView.image = currentMeme.memedImage
        return currentCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentSelectedMeme = memeList[indexPath.row]
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
    
    private func setupFlowLayout() {
        let space:CGFloat = cellSpacing
        var dimension: CGFloat
        if UIDevice.current.orientation.isLandscape {
            print("Setting dimesion on flowLayout for landscape")
            dimension = (view.frame.size.height - (2 * space)) / cellSpacing
        } else {
            print("Setting dimesion on flowLayout for portrait")
            dimension = (view.frame.size.width - (2 * space)) / cellSpacing
        }
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
}
