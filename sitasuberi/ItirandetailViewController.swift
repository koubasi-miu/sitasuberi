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
               
//        var zoomScale: CGFloat
//        zoomScale = min(self.scrollView.bounds.width / (self.imageView.image?.size.width)!, (self.scrollView.bounds.height) / (self.imageView.image?.size.height)!)
//        let currentImageHeight = (self.imageView.image?.size.height)! * zoomScale
//        zoomScale = self.scrollView.bounds.size.height / currentImageHeight
//        self.scrollView.maximumZoomScale = zoomScale
//        self.scrollView.minimumZoomScale = zoomScale
//        self.scrollView.zoomScale = zoomScale
//
        self.imageView.contentMode = .scaleAspectFit
               // 表示する画像
            //   let UIImage = UIImage(named: "itiranImageArray")!
              
            // 画像のサイズ
               let imgW = itiranImage.size.width
               let imgH = itiranImage.size.height
                
                scale = screenHeight / imgH
        let rect:CGRect = CGRect(x:0, y:0, width: imgW*scale, height: imgH*scale)
        
       

//               scale = screenHeight / imgH
        
//              func resize(image: UIImage) -> UIImage {
//              // 縦横の画素数を半分にする
//              let width = image.size.width * scale
//              let height = image.size.height * scale
//              // scale の設定が0だとオリジナル画像よりもサイズが大きくなるので1を設定
//              UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 1.0)
//              image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
//              let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
//              UIGraphicsEndImageContext()
//
//              return resizeImage!
//          }
               // UIImageView 初期化 インスタンス作成
               let imageView = UIImageView(image: itiranImage)
               
        imageView.frame = rect;
     
               scrollView.contentOffset.x = imgW
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
   
//    func updateZoom(){
//           var zoomScale: CGFloat
//           zoomScale = min(self.scrollView.bounds.width / (self.imageView.image?.size.width)!, (self.scrollView.bounds.height) / (self.imageView.image?.size.height)!)
//           if zoomScale > 1{
//               zoomScale = 1
//           }
//           let currentImageHeight = (self.imageView.image?.size.height)! * zoomScale
//           zoomScale = self.scrollView.bounds.size.height / currentImageHeight
//           self.scrollView.maximumZoomScale = zoomScale
//           self.scrollView.minimumZoomScale = zoomScale
//           self.scrollView.zoomScale = zoomScale
//       }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        // ナビゲーションを透明にする処理
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//    }
//
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
}
    

}

