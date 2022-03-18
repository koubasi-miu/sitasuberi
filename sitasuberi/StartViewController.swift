//
//  StartViewController.swift
//  sitasuberi
//
//  Created by Haruko Okada on 7/6/21.
//

import UIKit

class StartViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectArray = Array("　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　▼一覧" + String(repeating:" ", count: 1) + "▼これまでの記録" + String(repeating:" ", count: 36) + "▼チャレンジ" + String(repeating:" ", count: 2) + "▼使い方")
    
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
        
        
        let length = selectArray.count
        if indexPath[1] < length {
            cell.label.text = String(selectArray[indexPath[1]])
            if String(selectArray[indexPath[1]]) == "ー"{
                //Labelの回転などを行う場合にはアフィン変換を利用する
                let angle = 90 * CGFloat.pi / 180
                //                cell.label.transform = CGAffineTransform(scaleX: -1, y: 1);
                //                cell.label.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
                let affine = CGAffineTransform(a: cos(angle), b:sin(angle),
                                               c: sin(angle), d: -cos(angle),
                                               tx: 0, ty: 0)
                cell.label.transform = affine
                
            }else if String(selectArray[indexPath[1]]) == "、" || String(selectArray[indexPath[1]]) == "、" {
                cell.label.textAlignment = .right
                cell.label.text = String(selectArray[indexPath[1]]) + "\n"
            }
        }else {
            cell.label.text = ""
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 33, 34, 35:
            let itirannViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirannVC") as! ItirannViewController
            self.navigationController?.pushViewController(itirannViewController, animated: true)
            
        case 37, 38, 39, 40, 41, 42, 43, 44:
            let memoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemoryVC") as! MemoryViewController
            self.navigationController?.pushViewController(memoryViewController, animated: true)
            
        case 81, 82, 83, 84, 85, 86:
            let decideViewController = self.storyboard?.instantiateViewController(withIdentifier: "DecideVC") as! DecideViewController
            self.navigationController?.pushViewController(decideViewController, animated: true)
            
        case 89, 90, 91, 92:
            let tukaikataViewController = self.storyboard?.instantiateViewController(withIdentifier: "TukaikataVC") as! TukaikataViewController
            tukaikataViewController.tukaikataImage = UIImage(named: "tukaikata¥.png")!
            self.navigationController?.pushViewController(tukaikataViewController, animated: true)
        default:
            break
        }
        
    }
    
}

