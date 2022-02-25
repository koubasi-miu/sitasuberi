//
//  ChoiceViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2022/02/04.
//

import UIKit

class ChoiceViewController: UIViewController{
    
    
    let userDefaults = UserDefaults.standard
    var choices: [String] = []
    var selectedchoice: String!
    var selectdrow: Int!
    var resultValue: String!
    @IBOutlet var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func submit() {
            switch selectdrow {
            case 1:
                UserDefaults.standard.set(resultValue, forKey: "gyo")
            case 2:
                UserDefaults.standard.set(resultValue, forKey: "count")
            default:
                break
            }
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
            switch component {
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
            switch component {
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
            let loadingViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoadingVC") as! LoadingViewController
            switch component {
            case 0:
                loadingViewController.time = 30
                loadingViewController.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                    loadingViewController.time -= 1
                    loadingViewController.countLabel.text = String(loadingViewController.time)
                    
                    if loadingViewController.time == 0 {
                        timer.invalidate()
                        
                        let syuryo2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "Syuryo2VC") as! Syuryo2ViewController
                        syuryo2ViewController.number = Int.random(in: 0...1)
                        if syuryo2ViewController.number == 0 {
                            syuryo2ViewController.sutaImage = UIImage(named: "emoji1.png")!
                        }else{
                            syuryo2ViewController.sutaImage = UIImage(named: "emoji2.png")!
                        }
                        self.navigationController?.pushViewController(syuryo2ViewController, animated: true)
                        
                    }
                })
            case 1:
                loadingViewController.time = 0
                loadingViewController.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                    loadingViewController.time += 1
                    loadingViewController.countLabel.text = String(loadingViewController.time)
                    
                })
            default:
                break
            }
        }
    }
}

