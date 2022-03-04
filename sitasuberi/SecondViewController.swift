//
//  Louding2ViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/07/25.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectArray = Array("　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　お疲れ様でした！" + String(repeating:" ", count: 30) + "▼選択に戻る")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.bounds.size.width = self.view.bounds.size.width-45
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
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
        
        
        if indexPath.item == 73 || indexPath.item == 74 || indexPath.item == 75 || indexPath.item == 76 || indexPath.item == 77 || indexPath.item == 78 {
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartViewController
            self.navigationController?.pushViewController(startViewController, animated: true)
            print("the cell item selected is: \(indexPath.item)")
            print("the cell row selected is: \(indexPath.row)")
        }
        print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
        
    }
    
    
    
}
