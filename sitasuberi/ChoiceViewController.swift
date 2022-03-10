//
//  ChoiceViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2022/02/04.
//

import UIKit

class ChoiceViewController: UIViewController{
    let saveData = UserDefaults.standard
    var choices: [String] = []
    var selectedchoice: String!
    var selectdrow: Int!
    var resultValue: String!
    @IBOutlet var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func submit() {
        switch selectdrow {
        case 1:
            saveData.set(resultValue, forKey: "gyo")
        case 2:
            saveData.set(resultValue, forKey: "count")
        case 3:
            saveData.set(resultValue, forKey: "time")
        case 4:
            saveData.set(resultValue, forKey: "rokuon")
        default:
            break
        }
        // ハーフモーダルを閉じる
        self.dismiss(animated: true, completion: nil)
    }
}

extension ChoiceViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // 列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    
    // 表示する内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    // 選択されたときの挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectdrow == 1{
            switch row {
            case 0:
                resultValue = "agyo"
            case 1:
                resultValue = "kagyo"
            case 2:
                resultValue = "sagyo"
            case 3:
                resultValue = "tagyo"
            case 4:
                resultValue = "nagyo"
            case 5:
                resultValue = "hagyo"
            case 6:
                resultValue = "magyo"
            case 7:
                resultValue = "yagyo"
            case 8:
                resultValue = "ragyo"
            case 9:
                resultValue = "wagyo"
            case 10:
                resultValue = "uirou"
            default:
                break
            }
        }else if selectdrow == 2{
            switch row {
            case 0:
                resultValue = "さん"
            case 1:
                resultValue = "ご"
            case 2:
                resultValue = "はち"
            case 3:
                resultValue = "じゅう"
            case 4:
                resultValue = "ぜんぶ"
            default:
                break
            }
        }else if selectdrow == 3{
            switch row {
            case 0:
                resultValue = "じゅう"
            case 1:
                resultValue = "にじゅう"
            case 2:
                resultValue = "さんじゅう"
            case 3:
                resultValue = "よんご"
            case 4:
                resultValue = "いっぷん"
            case 5:
                resultValue = "きゅうじゅう"
            case 6:
                resultValue = "にふん"
            case 7:
                resultValue = "さんふん"
            case 8:
                resultValue = "けいそく"
            default:
                break
            }
        }else if selectdrow == 4{
            switch row{
            case 0:
                resultValue = "yes"
            case 1:
                resultValue = "no"
            default:
                break
            }
        }
    }
}
