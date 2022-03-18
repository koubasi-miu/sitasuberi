//
//  ItirannViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/07/09.
//

import UIKit

class ItirannViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itiranImageArray = [String]()
    
    
    var selectArray = Array("  どの一覧を見ますか？" + String(repeating:" ", count: 4) + "▼あ行" + String(repeating:" ", count: 1) + "▼か行" + String(repeating:" ", count: 1) + "▼さ行" + String(repeating:" ", count: 1) + "▼た行" + String(repeating:" ", count: 17) + "▼な行" + String(repeating:" ", count: 1) + "▼は行" + String(repeating:" ", count: 1) + "▼ま行" + String(repeating:" ", count: 1) + "▼や行" + String(repeating:" ", count: 17) + "▼ら行" + String(repeating:" ", count: 1) + "▼わ行" + String(repeating:" ", count: 1) + "▼外郎売" + String(repeating:" ", count: 1) + "▼詩" + String(repeating:" ", count: 17) + "▼鼻濁音")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        itiranImageArray = ["shi.png", "uirou.png"]
        self.collectionView.bounds.size.width = self.view.bounds.size.width-45
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
        let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
        
        switch indexPath.item {
        case 16, 17, 18:
            itirandetailViewController.itiranImage = UIImage(named: "agyoo.png")!
            
        case 20, 21, 22:
            itirandetailViewController.itiranImage = UIImage(named: "kagyoo.png")!
            
        case 24, 25, 26:
            itirandetailViewController.itiranImage = UIImage(named: "sagyoo.png")!
            
        case 28, 29, 30:
            itirandetailViewController.itiranImage = UIImage(named: "tagyoou.png")!
            
        case 48, 49, 50:
            itirandetailViewController.itiranImage = UIImage(named: "nagyoo.png")!
            
        case 52, 53, 54:
            itirandetailViewController.itiranImage = UIImage(named: "hagyoo.png")!
            
        case 56, 57, 58:
            itirandetailViewController.itiranImage = UIImage(named: "magyoou.png")!
            
        case 60, 61, 62:
            itirandetailViewController.itiranImage = UIImage(named: "yagyoo.png")!
            
        case 80, 81, 82:
            itirandetailViewController.itiranImage = UIImage(named: "ragyoou.png")!
            
        case 84, 85, 86:
            itirandetailViewController.itiranImage = UIImage(named: "wagyouu.png")!
            
        case 88, 89, 90, 91:
            itirandetailViewController.itiranImage = UIImage(named: "uirororo.png")!
            
        case 93, 94:
            itirandetailViewController.itiranImage = UIImage(named: "ししし.png")!
            
        case 112, 113, 114, 115:
            itirandetailViewController.itiranImage = UIImage(named: "bidakuon.png")!
            
        default:
            break
        }
        
        self.navigationController?.pushViewController(itirandetailViewController, animated: true)
    }
    
    
}
