//
//  StartViewController.swift
//  sitasuberi
//
//  Created by Haruko Okada on 7/6/21.
//

import UIKit

class StartViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectArray = Array("                   一覧" + String(repeating:" ", count: 30) + "チャレンジ" + String(repeating:" ", count: 27) + "これまでの記録")
    
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
        if indexPath.item == 19 || indexPath.item == 20 {
            let ItirannViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirannVC") as! ItirannViewController
            self.navigationController?.pushViewController(ItirannViewController, animated: true)
            print("the cell item selected is: \(indexPath.item)")
            print("the cell row selected is: \(indexPath.row)")
        }else if indexPath.item == 51 || indexPath.item == 52 || indexPath.item == 53 || indexPath.item == 54 || indexPath.item == 55 {
            let ChallengeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChallengeVC") as! ChallengeViewController
            self.navigationController?.pushViewController(ChallengeViewController, animated: true)
            print("the cell item selected is: \(indexPath.item)")
            print("the cell row selected is: \(indexPath.row)")
}else if indexPath.item == 83 || indexPath.item == 84 || indexPath.item == 85 || indexPath.item == 86 || indexPath.item == 87 || indexPath.item == 88 || indexPath.item == 89 {
    let MemoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemoryVC") as! MemoryViewController
    self.navigationController?.pushViewController(MemoryViewController, animated: true)
    print("the cell item selected is: \(indexPath.item)")
    print("the cell row selected is: \(indexPath.row)")
    
};print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
        
    }
    
}

