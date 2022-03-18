//
//  ModalViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2022/01/28.
//

import UIKit

class ModalViewController: UIViewController {
    
    //    @IBOutlet private weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension ModalViewController {
    
    static func instantiateInitialViewControllerFromStoryboard() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
            .instantiateInitialViewController() as! Self
    }
}

