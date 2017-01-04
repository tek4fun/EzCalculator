//
//  ViewController.swift
//  EzCalculator
//
//  Created by iOS Student on 1/4/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var distanceBetweenInputTextFieldAndResultLabel: NSLayoutConstraint!
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    @IBOutlet weak var txt_Input: UITextField!
    
    @IBOutlet weak var lbl_Result: UILabel!
    var isTappingNumber : Bool = false
    var isEndOperation: Bool = true
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txt_Input.isUserInteractionEnabled = false
    }
    
    func updateConstraints() -> Void {
        let scale = UIScreen.main.bounds.size.height/667
        
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.main.bounds.size.height > 448 ?
            distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextFieldAndResultLabel.constant = UIScreen.main.bounds.size.height > 480 ? distanceBetweenInputTextFieldAndResultLabel.constant * scale : distanceBetweenInputTextFieldAndResultLabel.constant * 0.1
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        let number = sender.currentTitle
        if isTappingNumber {
            txt_Input.text = txt_Input.text! + number!
            
        } else {
            txt_Input.text = number
            isTappingNumber = true
        }
    }
    
    @IBAction func OperatorAction(_ sender: UIButton) {
        operation = sender.currentTitle!
        if let inputOperation = Double(txt_Input.text!){
            if isEndOperation{
                firstNumber = inputOperation
                isEndOperation = false
            } else{
                firstNumber = Double(lbl_Result.text!)!
                txt_Input.text = "\(firstNumber)"
            }
        } else {
            print("Ban can nhap so truoc khi thuc hien tinh toan!")
        }
        isTappingNumber = false
        if operation == "%"{
            EqualAction(sender)
        } else if operation == "+/-"{
            EqualAction(sender)
        }
    }
    
    @IBAction func EqualAction(_ sender: UIButton) {
        isTappingNumber = false
        
        var result : Double = 0
        
        if let realSecondNumber = Double(txt_Input.text!) {
            secondNumber = realSecondNumber
        }
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "X":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber / 100
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
                result = firstNumber
            }else{
                firstNumber = -1 * firstNumber
                result = firstNumber
            }
            txt_Input.text = "\(result)"
        default:
            print("Error Operation")
        }
        
        lbl_Result.text = "\(result)"    }
    
    @IBAction func ACAction(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        txt_Input.text = ""
        lbl_Result.text = "0"
        isEndOperation = true
    }
}

