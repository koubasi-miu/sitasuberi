//
//  DecideViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/11/05.
//

import UIKit

class DecideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let userDefaults = UserDefaults.standard
    var fileName: String!
    
    var titleArray = Array("　　　設定を決めましょう" + String(repeating: " ", count: 4) + "▼行" + String(repeating: "　",count: 2) + "〇〇〇〇" + String(repeating: "　", count: 24) + "▼個数" + String(repeating: "　", count: 1) + "〇個" + String(repeating: "　", count: 26) + "▼時間" + String(repeating: "　", count: 1) + "〇〇〇〇" + String(repeating: "　", count: 24) + "▼録音" +  String(repeating: "　", count: 1) + "〇" + String(repeating:"　", count: 7) + "次へ")
    
    var gyolist = ["あ行","か行","さ行","た行","な行","は行","ま行","や行","ら行","わ行","外郎売"]
    var kosulist = ["三個","五個","八個","十個","全て"]
    var jikanlist = ["カウントダウン10秒","カウントダウン20秒","カウントダウン30秒","カウントダウン45秒","カウントダウン1分","カウントダウン1分30秒","カウントダウン2分","カウントダウン3分","時間計測"]
    var rokuonlist = ["〇","×"]
    var test: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        //        let width = self.view.frame.width
        //        let height = self.view.frame.height
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let rokuon = UserDefaults.standard.string(forKey: "rokuon")
        switch rokuon {
        case "yes":
            var alertTextField: UITextField?
            
            let alert = UIAlertController(
                title: "録音名",
                message: "録音のデータに名前をつけてください",
                preferredStyle: UIAlertController.Style.alert)
            alert.addTextField(
                configurationHandler: { [self](textField: UITextField!) in
                    alertTextField = textField
                    UserDefaults.standard.set(fileName, forKey: "filename")
                    fileName = textField.text
                    
                })
            alert.addAction(
                UIAlertAction(
                    title: "Cancel",
                    style: UIAlertAction.Style.cancel,
                    handler: nil))
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertAction.Style.default) { _ in
                        //                            if let text = alertTextField?.text {
                        //                   //             self.label1.text = text
                        //                            }
                    }
            )
            
        default:
            break
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ChoiceViewController") as! ChoiceViewController
        
        switch indexPath.item {
        case 20, 21, 22, 23:
            vc.choices += gyolist
            vc.selectdrow = 1
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                    sheet.prefersGrabberVisible = true
                }
                present(vc, animated: true, completion: nil)
            }
            
        case 52, 53:
            vc.choices += kosulist
            vc.selectdrow = 2
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                    sheet.prefersGrabberVisible = true
                }
                present(vc, animated: true, completion: nil)
            }
            
        case 84, 85, 86, 87:
            vc.choices += jikanlist
            vc.selectdrow = 3
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                    sheet.prefersGrabberVisible = true
                }
                present(vc, animated: true, completion: nil)
            }
            
        case 116, 117:
            vc.choices += rokuonlist
            vc.selectdrow = 4
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                    sheet.prefersGrabberVisible = true
                }
                present(vc, animated: true, completion: nil)
            }
            
        case 124, 125:
            let loadingViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingViewController
            self.navigationController?.pushViewController(loadingViewController, animated: true)
            
        default:
            break
        }
        
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
    
}



