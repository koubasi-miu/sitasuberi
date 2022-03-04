//
//  MemoryViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/07/09.
//

import UIKit
import AVFoundation

class MemoryViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, AVAudioPlayerDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    var audioPlayer: AVAudioPlayer!
    var isPlaying = false
 //   private var semiModalPresenter = SemiModalPresenter()
    var selectArray = Array("　　　これまでの記録" + String(repeating:" ", count: 41) + "再生")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let audioRecorder: AudioRecorder = AudioRecorder()
        
        self.collectionView.bounds.size.width = self.view.bounds.size.width-45
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
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

        
        if indexPath.item == 51 || indexPath.item == 52 {
            let audioRecorder: AudioRecorder = AudioRecorder()
            let gyo = UserDefaults.standard.string(forKey: "gyo")
            audioRecorder.play(a: gyo ?? "default")
            
            
        }
        
    }
    
    

}

