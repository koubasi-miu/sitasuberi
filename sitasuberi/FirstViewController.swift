//
//  FirstViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/06/11.
//

import UIKit

class FirstViewController: UIViewController ,UICollectionViewDataSource,
                           UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
   
    @IBOutlet weak var raod: UICollectionView!
    
    @IBOutlet weak var i: UICollectionViewCell!
    @IBOutlet weak var u: UICollectionViewCell!
    @IBOutlet weak var e: UICollectionViewCell!
    @IBOutlet weak var o: UICollectionViewCell!
    @IBOutlet weak var ka: UICollectionViewCell!
    @IBOutlet weak var ki: UICollectionViewCell!
    @IBOutlet weak var ku: UICollectionViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
