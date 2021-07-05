//
//  SideScrollViewController.swift
//  sitasuberi
//
//  Created by Haruko Okada on 7/4/21.
//

import UIKit

class SideScrollViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    var charArray = Array("                                   |滑舌チャレンジ|")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 160
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! NewCollectionViewCell
//        cell.label.text = String(indexPath[1])
        
        //indexPathは配列で、[0]にSectionナンバー、[1]にcellの番号が入っているよ
        let length = charArray.count
        if indexPath[1] < length {
            cell.label.text = String(charArray[indexPath[1]])
            if String(charArray[indexPath[1]]) == "ー"{
                //Labelの回転などを行う場合にはアフィン変換を利用する
                let angle = 90 * CGFloat.pi / 180
//                cell.label.transform = CGAffineTransform(scaleX: -1, y: 1);
//                cell.label.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
                let affine = CGAffineTransform(a: cos(angle), b:sin(angle),
                                                       c: sin(angle), d: -cos(angle),
                                                       tx: 0, ty: 0)
                cell.label.transform = affine

            }else if String(charArray[indexPath[1]]) == "、" || String(charArray[indexPath[1]]) == "、" {
                cell.label.textAlignment = .right
                cell.label.text = String(charArray[indexPath[1]]) + "\n"
            }
        }else{
            cell.label.text = ""
        }
        
        
        return cell
    }
    
    private let spacing:CGFloat = 16.0
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let numberOfItemsPerRow:CGFloat = 4
//            let spacingBetweenCells:CGFloat = 16
//
//            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
//
//            if let collection = self.collectionView{
//                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//                return CGSize(width: width, height: width)
//            }else{
//                return CGSize(width: 0, height: 0)
//            }
//    }
//
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

}
