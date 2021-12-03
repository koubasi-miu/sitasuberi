//
//  DecideViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/11/05.
//

import UIKit

class DecideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var titleArray = Array("　　　設定を決めましょう" + String(repeating: " ", count: 4) + "▼行" + String(repeating: "　",count: 2) + "〇〇〇〇" + String(repeating: "　", count: 24) + "▼個数" + String(repeating: "　", count: 1) + "〇個" + String(repeating: "　", count: 26) + "▼時間" + String(repeating: "　", count: 1) + "〇〇〇〇" + String(repeating: "　", count: 24) + "▼録音" +  String(repeating: "　", count: 1) + "〇" + String(repeating:"　", count: 7) + "次へ")
    
    var pickerView: UIPickerView = UIPickerView()
    let pickerViewHeight:CGFloat = 160
    var pickerToolbar:UIToolbar!
    let toolbarHeight:CGFloat = 40.0
    var gyolist = ["あ行","か行","さ行","た行","な行","は行","ま行","や行","ら行","わ行","外郎売"]
    var kosulist = ["三個","五個","八個","十個","十五個","全て"]
    var jikanlist = ["カウントダウン","時間計測"]
    var rokuonlist = ["〇","×"]
    var pickerIndexPath:IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView = UIPickerView(frame:CGRect(x:0,y:height + toolbarHeight,
                                                       width:width,height:pickerViewHeight))
        self.view.addSubview(pickerView)
        
        pickerToolbar = UIToolbar(frame:CGRect(x:0,y:height,width:width,height:toolbarHeight))
               let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(self.doneTapped))
                pickerToolbar.items = [flexible,doneBtn]
               self.view.addSubview(pickerToolbar)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
     @objc func doneTapped(){
            UIView.animate(withDuration: 0.2){
                self.pickerToolbar.frame = CGRect(x:0,y:self.view.frame.height,
                                                  width:self.view.frame.width,height:self.toolbarHeight)
                self.pickerView.frame = CGRect(x:0,y:self.view.frame.height + self.toolbarHeight,
                                               width:self.view.frame.width,height:self.pickerViewHeight)
                self.collectionView.contentOffset.y = 0
            }
            self.collectionView.deselectItem(at: pickerIndexPath, animated: true)
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerIndexPath != nil){
                    switch (pickerIndexPath.row){
                    case 0:
                        return gyolist.count
                    case 1:
                        return kosulist.count
                    case 2:
                        return jikanlist.count
                    case 3:
                        return rokuonlist.count
                    default:
                        return 0
                    }
                }else{
                    return 0
                }
        }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (pickerIndexPath.row){
                   case 0:
                       return gyolist[row]
                   case 1:
                       return kosulist[row]
                   case 2:
                       return jikanlist[row]
                   case 3:
                       return rokuonlist[row]
                   default:
                           return ""  }
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
        
        
        if indexPath.item == 124 || indexPath.item == 125 {
            let challengeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChallengeVC") as! ChallengeViewController
            self.navigationController?.pushViewController(challengeViewController, animated: true)
            print("the cell item selected is: \(indexPath.item)")
            print("the cell row selected is: \(indexPath.row)")
        }else if indexPath.item == 20 || indexPath.item == 21 {
            pickerView.selectRow(gyolist.count,inComponent: 1,animated: false)
//        }else if indexPath.item == 52 || indexPath.item == 53 {
//            pickerView.selectRow(kosulist.count,inComponent: 1,animated: false)
//        }else if indexPath.item == 84 || indexPath.item == 85 {
//            pickerView.selectRow(jikanlist.count,inComponent: 1,animated: false)
//        }else if indexPath.item == 116 || indexPath.item == 117 {
//            pikerView.selectRow(rokuonlist.count,inComponent: 1,animated: false)
        }
        print("the cell item selected is: \(indexPath.item)")
        print("the cell row selected is: \(indexPath.row)")
        
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.2) {
                    self.pickerToolbar.frame = CGRect(x:0,y:self.view.frame.height - self.pickerViewHeight - self.toolbarHeight,
                                                      width:self.view.frame.width,height:self.toolbarHeight)
                    self.pickerView.frame = CGRect(x:0,y:self.view.frame.height - self.pickerViewHeight,
                                                   width:self.view.frame.width,height:self.pickerViewHeight)
                }
        
    }
    

}
