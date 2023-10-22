//
//  ViewController.swift
//  UIView_Controller
//
//  Created by Keto Nioradze on 22.10.23.
//
import UIKit

class ViewController: UIViewController {
    // Creating properties
    @IBOutlet weak var inputPointer: UILabel!
    @IBOutlet weak var inputFirst: UITextField!
    @IBOutlet weak var inputSecond: UITextField!
    @IBOutlet weak var buttonName: UIButton!
    @IBOutlet weak var result: UILabel!
    
    
    // LifeCycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        inputPointer.text = "უდიდესი საერთო გამყოფი"
        inputFirst.placeholder = "რიცხვი 1"
        inputSecond.placeholder = "რიცხვი 2"
        buttonName.setTitle("გამოთვლა", for: .normal)
        buttonName.setTitleColor(.darkGray, for: .normal)
        result.text = "შედეგი"
    }
    
    
    // Action functions
    @IBAction func `switch`(_ sender: UISwitch) {
        inputPointer.text = sender.isOn ? "უდიდესი საერთო გამყოფი" : "უმცირესი საერთო ჯერადი"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        if let number1 = Int(inputFirst.text!){
            if let number2 = Int(inputSecond.text!) {
                if inputPointer.text == "უდიდესი საერთო გამყოფი" {
                    result.text = "\(findGCD(number1, number2))"
                } else {
                    result.text = "\(findLCM(number1, number2))"
                }
                inputSecond.backgroundColor = .systemGray6
            } else {
                inputSecond.backgroundColor = .red
                print("Write valid integers")
            }
            inputFirst.backgroundColor = .systemGray6
        } else {
            inputFirst.backgroundColor = .red
        }
        
    }

    
    // Methods to use in action functions
    func findGCD(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return abs(x)
    }
    
    func findLCM(_ a: Int, _ b: Int) -> Int {
        func findGCD(_ a: Int, _ b: Int) -> Int {
            var x = a
            var y = b
            while y != 0 {
                let temp = y
                y = x % y
                x = temp
            }
            return abs(x)
        }
        return (a * b) / findGCD(a, b)
    }
}

