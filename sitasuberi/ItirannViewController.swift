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
    
    
    var selectArray = Array("  どの一覧を見ますか？" + String(repeating:" ", count: 20) + "▼あ行" + String(repeating:" ", count: 1) + "▼か行" + String(repeating:" ", count: 1) + "▼さ行" + String(repeating:" ", count: 1) + "▼た行" + String(repeating:" ", count: 17) + "▼な行" + String(repeating:" ", count: 1) + "▼は行" + String(repeating:" ", count: 1) + "▼ま行" + String(repeating:" ", count: 1) + "▼や行" + String(repeating:" ", count: 17) + "▼ら行" + String(repeating:" ", count: 1) + "▼わ行" + String(repeating:" ", count: 1) + "▼外郎売" + String(repeating:" ", count: 1) + "▼詩")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        itiranImageArray = ["shi.png", "uirou.png"]
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
        if indexPath.item == 32 || indexPath.item == 33 || indexPath.item == 34{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "agyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 36 || indexPath.item == 37 || indexPath.item == 38{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "kagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 40 || indexPath.item == 41 || indexPath.item == 42{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "sagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 45 || indexPath.item == 46 || indexPath.item == 47{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "tagyoou.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 64 || indexPath.item == 65 || indexPath.item == 66{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "nagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 68 || indexPath.item == 69 || indexPath.item == 70{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "hagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 72 || indexPath.item == 73 || indexPath.item == 74{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "magyoou.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 76 || indexPath.item == 77 || indexPath.item == 78{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "yagyoo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 96 || indexPath.item == 97 || indexPath.item == 98{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "ragyoou.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if  indexPath.item == 100 || indexPath.item == 101 || indexPath.item == 102{
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "wagyouu.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if indexPath.item == 106 || indexPath.item == 105 || indexPath.item == 104 || indexPath.item == 107 {
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "uirororo.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }else if indexPath.item == 109 || indexPath.item == 110 {
            let itirandetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItirandetailVC") as! ItirandetailViewController
            
            itirandetailViewController.itiranImage = UIImage(named: "ししし.png")!
            
            
            self.navigationController?.pushViewController(itirandetailViewController, animated: true)
        }
        print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
    }
}
