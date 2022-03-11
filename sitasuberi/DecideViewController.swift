//
//  DecideViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2021/11/05.
//

import UIKit

class DecideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var fileName: String!
    var titleArray = Array("　　　設定を決めましょう" + String(repeating: " ", count: 4) + "▼行" + String(repeating: "　",count: 2) + "〇〇〇〇" + String(repeating: "　", count: 24) + "▼個数" + String(repeating: "　", count: 1) + "〇個" + String(repeating: "　", count: 26) + "▼時間" + String(repeating: "　", count: 1) + "〇〇〇〇" + String(repeating: "　", count: 24) + "▼録音" +  String(repeating: "　", count: 1) + "〇" + String(repeating:"　", count: 7) + "次へ")
    var gyoList = ["あ行","か行","さ行","た行","な行","は行","ま行","や行","ら行","わ行","外郎売"]
    var kosuList = ["三個","五個","八個","十個","全て"]
    var jikanList = ["カウントダウン10秒","カウントダウン20秒","カウントダウン30秒","カウントダウン45秒","カウントダウン1分","カウントダウン1分30秒","カウントダウン2分","カウントダウン3分","時間計測"]
    var rokuonList = ["〇","×"]
    var test: String!
    let saveData: UserDefaults = UserDefaults.standard
    var gyo: Int?
    var count: Int?
    var time: Int?
    var isRokuon: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionViewの設定
        self.collectionView.bounds.size.width = self.view.bounds.size.width-10
        self.collectionView.bounds.size.height = self.view.bounds.size.height
        self.collectionView.center = self.view.center
        collectionView.dataSource = self
        collectionView.delegate = self
        updateText()
        
        // 初期値取得
        gyo = saveData.object(forKey: "gyo") as? Int
        count = saveData.object(forKey: "count") as? Int
        time = saveData.object(forKey: "time") as? Int
        isRokuon = saveData.bool(forKey: "isRokuon")
        
        // 更新用のタイマーを設定
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateText), userInfo: nil, repeats: true)
    }
    
    func checkRokuon() -> Bool {
        var isOk = false
        if UserDefaults.standard.bool(forKey: "isRokuon") == true {
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
                        if let text = alertTextField?.text {
                            // OKの場合、保存名を格納してあげる
                            UserDefaults.standard.set(text, forKey: "rokuonFileName")
                            // 成功したことを記録する
                            isOk = true
                        }
                    }
            )
        }
        return isOk
    }
    
    @objc func updateText() {
        let gyoUpdate = saveData.object(forKey: "gyo") as? Int
        let countUpdate = saveData.object(forKey: "count") as? Int
        let timeUpdate = saveData.object(forKey: "time") as? Int
        let isRokuonUpdate = saveData.bool(forKey: "isRokuon")
        var gyoText = "〇〇〇〇"
        var countText = "〇個"
        var timeText = "〇〇〇〇"
        var isRokuonText = "×"
        var isUpdate = false
        
        if gyoUpdate != nil && gyo != gyoUpdate {
            gyo = gyoUpdate
            isUpdate = true
        }
        
        if countUpdate != nil && count != countUpdate {
            count = countUpdate
            isUpdate = true
        }
        
        if timeUpdate != nil && time != timeUpdate {
            time = timeUpdate
            isUpdate = true
        }
        
        if isRokuonUpdate == true && isRokuon != isRokuonUpdate {
            isRokuon = isRokuonUpdate
            isUpdate = true
        }
        
        if gyo != nil {
            gyoText = gyoList[gyo!]
        }
        if count != nil {
            countText = kosuList[count!]
        }
        if time != nil {
            timeText = jikanList[time!]
        }
        if isRokuonUpdate == true {
            isRokuonText = "〇"
        }
        
        if isUpdate {
            titleArray = Array("　　　設定を決めましょう" + String(repeating: " ", count: 4) + "▼行" + String(repeating: "　",count: 2) + formatTextSize(text: gyoText, length: 4) + String(repeating: "　", count: 24) + "▼個数" + String(repeating: "　", count: 1) + formatTextSize(text: countText, length: 2) + String(repeating: "　", count: 26) + "▼時間" + String(repeating: "　", count: 1) + formatTextSize(text: timeText, length: 4) + String(repeating: "　", count: 24) + "▼録音" +  String(repeating: "　", count: 1) + isRokuonText + String(repeating:"　", count: 7) + "次へ")
            collectionView.reloadData()
        }
    }
    
    func formatTextSize(text: String?, length: Int) -> String {
        if text == nil {
            return String(repeating: "〇", count: length)
        }else if text!.count < length {
            return text! + String(repeating: " ", count: length - text!.count)
        } else {
            return text!
        }
    }

    // ハーフモーダルを呼び出す関数を作ってあげる！同じものが繰り返される時は、こんな感じでまとめてあげよう！
    func showHalfmodal(selectMode: Int) {
        if let vc = self.storyboard!.instantiateViewController(withIdentifier: "ChoiceViewController") as? ChoiceViewController {
            vc.selectdrow = selectMode
            switch selectMode {
            case 1:
                vc.choices = gyoList
            case 2:
                vc.choices += kosuList
            case 3:
                vc.choices += jikanList
            case 4:
                vc.choices += rokuonList
            default:
                vc.choices = []
            }
            
            // ハーフモーダルを呼び出す
            if #available(iOS 15.0, *) {
                if let sheet = vc.sheetPresentationController {
                    // モーダルのサイズを指定する
                    sheet.detents = [.medium(), .large()]
                    // 上部の短いバーを表示する（デフォルトは非表示）
                    sheet.prefersGrabberVisible = true
                }
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 124 || indexPath.item == 125 {
            let loadingViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingViewController
            self.navigationController?.pushViewController(loadingViewController, animated: true)
        }else if indexPath.item == 20 || indexPath.item == 21 || indexPath.item == 22 || indexPath.item == 23 {
            // 行を選択
            showHalfmodal(selectMode: 1)
        }else if indexPath.item == 52 || indexPath.item == 53 {
            // 個数を選択
            showHalfmodal(selectMode: 2)
        }else if indexPath.item == 84 || indexPath.item == 85 || indexPath.item == 86 || indexPath.item == 87 {
            // 時間を選択
            showHalfmodal(selectMode: 3)
        }else if indexPath.item == 116 || indexPath.item == 117 {
            // 録音の有無を選択
            showHalfmodal(selectMode: 4)
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
