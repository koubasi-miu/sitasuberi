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
         if indexPath.item == 16 || indexPath.item == 17 || indexPath.item == 18{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "agyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 20 || indexPath.item == 21 || indexPath.item == 22{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "kagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 24 || indexPath.item == 25 || indexPath.item == 26{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "sagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 28 || indexPath.item == 29 || indexPath.item == 30{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "tagyoou.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 48 || indexPath.item == 49 || indexPath.item == 50{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "nagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
       }else if  indexPath.item == 52 || indexPath.item == 53 || indexPath.item == 54{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "hagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 56 || indexPath.item == 57 || indexPath.item == 58{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "magyoou.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 60 || indexPath.item == 61 || indexPath.item == 62{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "yagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 80 || indexPath.item == 81 || indexPath.item == 82{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "ragyoou.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 84 || indexPath.item == 85 || indexPath.item == 86{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "wagyouu.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if indexPath.item == 88 || indexPath.item == 89 || indexPath.item == 90 || indexPath.item == 91 {
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "uirororo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if indexPath.item == 93 || indexPath.item == 94 {
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "ししし.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if indexPath.item == 112 || indexPath.item == 113 || indexPath.item == 114 || indexPath.item == 115 {
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "bidakuon.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }
        print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
        
    
}


}
