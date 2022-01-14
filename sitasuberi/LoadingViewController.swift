//
//  LoadingViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/07/25.
//

import UIKit

class LoadingViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var countLabel: UILabel!
    var time = 0
    var timer = Timer()
    var i = 0
    var hayakutiArray = [String]()
    var selectArray = [String]()
    
    
//    func countLabel.backgroundColor = UIColor(patternImage: UIImage(named: "kauntowaku.png")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        countLabel.backgroundColor = UIColor(patternImage: UIImage(named: "kauntowaku.png")!)
        
        countLabel.text = String(time)
        hayakutiArray.shuffle()
        
        // choicehayakuti()
        // Do any additional setup after loading the view.
    }
    
    //  var selectArray = [String]()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 160
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! NewCollectionViewCell
        
        // let tempArray = hayakutiArray[i]
        
        let selectArray = Array(hayakutiArray[i])
        
        print("表示されるのは\(i)")
        let length = selectArray.count
        if indexPath[1] < length {
            cell.label.text = String((selectArray[indexPath[1]]))
            
            
            if String((selectArray[indexPath[1]])) == "ー"{
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
        if indexPath.item == 107 || indexPath.item == 108 || indexPath.item == 109 {
            i = i - 1
            print("表示\(i)")
            
            collectionView.reloadData()
            
            
            if i == 0 {
                
                let syuryo2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "Syuryo2VC") as! Syuryo2ViewController
                timer.invalidate()
                syuryo2ViewController.number = Int.random(in: 0...1)
                if syuryo2ViewController.number == 0 {
                    syuryo2ViewController.sutaImage = UIImage(named: "emoji1.png")!
                }else{
                    syuryo2ViewController.sutaImage = UIImage(named: "emoji2.png")!
                }
                self.navigationController?.pushViewController(syuryo2ViewController, animated: true)
                
               
                    
                }
            }
            print("the cell item selected is: \(indexPath.item)")
            print("the cell row selected is: \(indexPath.row)")
        }
        
    }
    
    

