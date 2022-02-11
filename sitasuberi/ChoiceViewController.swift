//
//  ChoiceViewController.swift
//  sitasuberi
//
//  Created by 藤井美羽 on 2022/02/04.
//

import UIKit

class ChoiceViewController: UIViewController{
    

    var choices: [String] = []
    var selectedchoice: String!
    @IBOutlet var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    @IBAction func submit() {
        if let vc = self.presentingViewController as? DecideViewController {
            vc.choice = selectedchoice
            self.dismiss(animated: true, completion: nil)
        }
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
        selectedchoice = choices[row]
    }
}
