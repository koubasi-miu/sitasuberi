//
//  SyuryoViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/09/24.
//

import UIKit

class SyuryoViewController: UIViewController {

    @IBOutlet weak var otuImageView: UIImageView!
    var scale:CGFloat = 1.0
       // Screenの高さ
       var screenHeight:CGFloat!
       // Screenの幅
       var screenWidth:CGFloat!
    
    var otuImage = UIImage()
    
    var number:Int!
    
    @IBAction func modoru() {
        let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartViewController
        self.navigationController?.pushViewController(startViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let otuW = otuImage.size.width
        let otuH = otuImage.size.height
        
        scale = screenHeight/otuH
        
        let rect:CGRect = CGRect(x: 0, y: 0, width: otuW*scale, height: otuH*scale)
        
        let imageView = UIImageView(image: otuImage)
        imageView.frame = rect;
        
        otuImageView.addSubview(imageView)
        
        // Do any additional setup after loading the view.
    }
    

    

}
