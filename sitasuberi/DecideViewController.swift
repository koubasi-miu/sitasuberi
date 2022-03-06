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
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
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
                                //            textField.text = self.label1.text
                            
                            // textField.placeholder = "Mike"
                            // textField.isSecureTextEntry = true
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
                            if let text = alertTextField?.text {
                   //             self.label1.text = text
                            }
                        }
                    )

        default:
            break
        }
        // Do any additional setup after loading the view.
    }
    
            
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 124 || indexPath.item == 125 {
            let loadingViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingViewController
            self.navigationController?.pushViewController(loadingViewController, animated: true)
        }else if indexPath.item == 20 || indexPath.item == 21 || indexPath.item == 22 || indexPath.item == 23 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ChoiceViewController") as! ChoiceViewController
            vc.choices += gyolist
            vc.selectdrow = 1
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    // モーダルのサイズを指定する
                    sheet.detents = [.medium(), .large()]
                    // 上部の短いバーを表示する（デフォルトは非表示）
                    sheet.prefersGrabberVisible = true
                    // 元のViewControllerも操作できるようにする
                 //   sheet.largestUndimmedDetentIdentifier = .medium
                }
                present(vc, animated: true, completion: nil)
            }
            }else if indexPath.item == 52 || indexPath.item == 53 {
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "ChoiceViewController") as! ChoiceViewController
                vc.choices += kosulist
                vc.selectdrow = 2
                if #available(iOS 15.0, *) {
                    if let sheet = vc.sheetPresentationController {
                        // モーダルのサイズを指定する
                        sheet.detents = [.medium(), .large()]
                        // 上部の短いバーを表示する（デフォルトは非表示）
                        sheet.prefersGrabberVisible = true
                        // 元のViewControllerも操作できるようにする
                       // sheet.largestUndimmedDetentIdentifier = .medium
                    }
                    present(vc, animated: true, completion: nil)
                    
                }
            }else if indexPath.item == 84 || indexPath.item == 85 || indexPath.item == 86 || indexPath.item == 87 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ChoiceViewController") as! ChoiceViewController
            vc.choices += jikanlist
                vc.selectdrow = 3
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    // モーダルのサイズを指定する
                    sheet.detents = [.medium(), .large()]
                    // 上部の短いバーを表示する（デフォルトは非表示）
                    sheet.prefersGrabberVisible = true
                    // 元のViewControllerも操作できるようにする
                  //  sheet.largestUndimmedDetentIdentifier = .medium
                }
                present(vc, animated: true, completion: nil)
            }
        }else if indexPath.item == 116 || indexPath.item == 117 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ChoiceViewController") as! ChoiceViewController
            vc.choices += rokuonlist
            vc.selectdrow = 4
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    // モーダルのサイズを指定する
                    sheet.detents = [.medium(), .large()]
                    // 上部の短いバーを表示する（デフォルトは非表示）
                    sheet.prefersGrabberVisible = true
                    // 元のViewControllerも操作できるようにする
                //    sheet.largestUndimmedDetentIdentifier = .medium
                }
                present(vc, animated: true, completion: nil)
            }
            }else{
        print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
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
    
    

