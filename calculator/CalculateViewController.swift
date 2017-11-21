//
//  CalculateViewController.swift
//  calculator
//
//  Created by 許尹瀞 on 2017/10/31.
//  Copyright © 2017年 yvonne. All rights reserved.


import UIKit

class CalculateViewController: UIViewController {
    
    
    @IBOutlet weak var exceptBToutlet: UIButton!
    @IBOutlet weak var multiplyBToutlet: UIButton!
    @IBOutlet weak var lessBToutlet: UIButton!
    @IBOutlet weak var addBToutlet: UIButton!
    @IBOutlet weak var ResultBToutlet: UIButton!
    

    var choice = ""
    var Resultchoice = ""
    var numberclick: Bool = false
    var totalNumber: Double = 0
    var oneNumber:Double = 0
    var TwoNumber:Double = 0
    var ThreeNumber:Double = 0
    //這是取得數值的，當他觸發後會取numberLabel內的值，跑到set後 numberLabel就重置了。
    var getnumber:Double {
        get {
            return Double(NumberLabel.text!)!
        }
        set {
            NumberLabel.text = String(newValue)
         // NumberLabel.text ="\(newValue)"
           
            numberclick = false
        }
    }

    
    //比對Button的選項
    func Resultnumber (){
        if choice == "+"{
            totalNumber = oneNumber + TwoNumber
            NumberLabel.text = "\(totalNumber)" //改變輸入框的內容
        }
        if choice == "-"{
            totalNumber = oneNumber - TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "×"{
            totalNumber = oneNumber * TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "÷"{
            totalNumber = oneNumber / TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "%"{
            totalNumber = oneNumber/100
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "+/-"{
            totalNumber = -oneNumber
            NumberLabel.text = "\(totalNumber)"
        }
    }
    
    
    //當按下加減乘除的數字後，choice會取得Button按鍵的Title。
    @IBAction func OrangeColorBTAction(_ sender: UIButton){
        choice = sender.currentTitle!
        print(choice)
        numberclick = false
        oneNumber = getnumber
    }
    
    @IBAction func percentage(_ sender: Any) {
        choice = (sender as AnyObject).currentTitle!!
        print(choice)
        numberclick = false
        oneNumber = getnumber
    }
    
    @IBAction func negative(_ sender: Any) {
        choice = (sender as AnyObject).currentTitle!!
        print(choice)
        numberclick = false
        oneNumber = getnumber
    }
    @IBOutlet var numberBT: [UIButton]!
    
    @IBAction func numberBT(_ sender: UIButton) {
        let number = sender.currentTitle
        
        if numberclick{
            NumberLabel.text = NumberLabel.text! + number!
            print("\(NumberLabel.text)")
        }else{
            if number != "0"{
                NumberLabel.text = number!
                numberclick = true
            }else {
                NumberLabel.text = "0"
            }
            
        }
    }
    

    //清空所有數值
    @IBAction func ClearBT(_ sender: UIButton) {
        totalNumber = 0
        oneNumber = 0
        TwoNumber = 0
        NumberLabel.text = "\(totalNumber)"
        numberclick = false
    }
    //使用者按下 = 鍵後取得使用者輸入的第二個數字然後比對做運算
    @IBAction func ResultBT(_ sender: UIButton) {
        TwoNumber = getnumber
        Resultnumber()
    }
    
    @IBOutlet weak var NumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    NumberLabel.text = "\(totalNumber)"
    ResultBToutlet.layer.cornerRadius = ResultBToutlet.frame.size.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
