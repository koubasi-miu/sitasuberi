//
//  StartViewController.swift
//  sitasuberi
//
//  Created by Haruko Okada on 7/6/21.
//

import UIKit

class StartViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 160
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! NewCollectionViewCell
        return cell
    }
    

}
