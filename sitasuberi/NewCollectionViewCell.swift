//
//  NewCollectionViewCell.swift
//  sitasuberi
//
//  Created by Haruko Okada on 7/5/21.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //cellの枠の太さ
        self.layer.borderWidth = 1
        //cellの枠の色
        self.layer.borderColor = #colorLiteral(red: 0.893630445, green: 0.8950561881, blue: 0.8464159369, alpha: 1)
//        self.layer.borderColor = #colorLiteral(red: 0.3795862794, green: 0.3773348629, blue: 0.3813202381, alpha: 1)
        //cellを丸くする
//        self.layer.cornerRadius = UIScreen.main.bounds.size.width/50
        
    }
}
