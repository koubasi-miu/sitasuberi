//
//  ItirandetailViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/07/25.
//

import UIKit

class ItirandetailViewController: UIViewController, UIScrollViewDelegate {

    var itiranImageArray = [String]()
    
    @IBOutlet weak var imageView: UIImageView!
    var itiranImage = UIImage()
    
    var scrollView = UIScrollView()
    var scale:CGFloat = 1.0
       // Screenの高さ
       var screenHeight:CGFloat!
       // Screenの幅
       var screenWidth:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 画面サイズ取得
               let screenSize: CGRect = UIScreen.main.bounds
               screenWidth = screenSize.width
               screenHeight = screenSize.height
               
               // 表示窓のサイズと位置を設定
               scrollView.frame.size =
                   CGSize(width: screenWidth, height: screenHeight)
               scrollView.center = self.view.center
               
//
        self.imageView.contentMode = .scaleAspectFit
              
            // 画像のサイズ
               let imgW = itiranImage.size.width
               let imgH = itiranImage.size.height
                
                scale = screenHeight / imgH
        let rect:CGRect = CGRect(x:0, y:0, width: imgW*scale, height: imgH*scale)
        
       
               // UIImageView 初期化 インスタンス作成
               let imageView = UIImageView(image: itiranImage)
               
        imageView.frame = rect;
     
               scrollView.contentOffset.x = imgW*scale
//               scrollView.contentOffset.y = 50
               // UIScrollViewに追加
               scrollView.addSubview(imageView)
        
               // UIScrollViewの大きさを画像サイズに設定
        scrollView.contentSize = CGSize(width: imageView.frame.width, height: imageView.frame.height)
       
        scrollView.contentMode = .scaleAspectFill
               // スクロールの跳ね返り無し
               scrollView.bounces = false
               
               // ビューに追加
               self.view.addSubview(scrollView)
        
               scrollView.showsVerticalScrollIndicator = false //縦スクロールを不可
     
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
}
    

}

