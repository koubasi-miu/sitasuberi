//
//  SideScrollViewController.swift
//  sitasuberi
//
//  Created by Haruko Okada on 7/4/21.
//

import UIKit

class SideScrollViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var titleArray = Array("                                   |滑舌チャレンジ|" + String(repeating: " ", count: 42) + "▼スタート")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.bounds.size.width = self.view.bounds.size.width
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        //   self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 160
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! NewCollectionViewCell
        
        let length = titleArray.count
        if indexPath[1] < length {
            cell.label.text = String(titleArray[indexPath[1]])
            if String(titleArray[indexPath[1]]) == "ー"{
                //Labelの回転などを行う場合にはアフィン変換を利用する
                let angle = 90 * CGFloat.pi / 180
                
                let affine = CGAffineTransform(a: cos(angle), b:sin(angle),
                                               c: sin(angle), d: -cos(angle),
                                               tx: 0, ty: 0)
                cell.label.transform = affine
                
            }else if String(titleArray[indexPath[1]]) == "、" || String(titleArray[indexPath[1]]) == "、" {
                cell.label.textAlignment = .right
                cell.label.text = String(titleArray[indexPath[1]]) + "\n"
            }
        } else {
            cell.label.text = ""
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 86 , 87 , 88 , 89 , 90:
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartViewController
            self.navigationController?.pushViewController(startViewController, animated: true)
            
        default:
            break
        }
    }
    
    
    
}
