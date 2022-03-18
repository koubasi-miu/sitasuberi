//
//  Syuryo2ViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/12/10.
//

import UIKit

class Syuryo2ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    
    var sutaImage = UIImage()
    var number:Int!
    var sutaImageArray = [String]()
    var titleArray = Array(String(repeating: " ", count: 49) + "お疲れ様でした！" + String(repeating: " ", count: 30) + "▼トップに戻る" + String(repeating: "　", count: 9) + "▼設定変更" + String(repeating: "　", count: 11) + "▼もう一度")
    
    var scale:CGFloat = 1.0
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.bounds.size.width = self.view.bounds.size.width-45
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // 表示窓のサイズと位置を設定
        imageView.frame = CGRect(x:0, y:0, width: screenWidth/9, height: screenHeight/16)
        imageView.center = self.view.center
        
        self.imageView.contentMode = .scaleAspectFit
        
        // 画像のサイズ
        let imgW = sutaImage.size.width
        let imgH = sutaImage.size.height
        
        scale = screenHeight / 4
        //     let rect:CGRect = CGRect(x:0, y:0, width: imgW*scale, height: imgH*scale)
        imageView.image = sutaImage
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
        
        switch indexPath.item{
        case 86, 87, 88, 89, 90, 91, 92, 93:
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartViewController
            self.navigationController?.pushViewController(startViewController, animated: true)
            
        case 103, 104, 105, 106, 107:
            let decideViewController = self.storyboard?.instantiateViewController(withIdentifier: "DecideVC") as! DecideViewController
            self.navigationController?.pushViewController(decideViewController, animated: true)
            
        case 119, 120, 121, 122, 123:
            let loadingViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingViewController
            self.navigationController?.pushViewController(loadingViewController, animated: true)
        default:
            break
        }
    }
    
    
}
