//
//  ViewController.swift
//  CalculatorApp2
//
//  Created by Akniyet Turdybay on 07.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myLabel: UILabel!
    
    var canType = false
    var isOperation = false
    @IBAction func myButton(_ sender: UIButton) {
        
        let currentLabel = myLabel.text!
        var currentDigit = sender.currentTitle!
        
        if currentLabel.contains(".") && currentDigit == "."{
            currentDigit = ""
        }
        else if isOperation{
//            currentDigit = ""
            myLabel.text = currentDigit
            isOperation = false
        }
        else if ((currentLabel != "0" && canType) || (myLabel.text == "0" && currentDigit == ".")){
            let zeroNumber = myLabel.text!
            myLabel.text = zeroNumber + currentDigit
            canType = true
        }
        else{
            myLabel.text = currentDigit
            canType = true
            
        }

        
        
    }
    
    
    var operation = "+"
    var firstNumber:Double?
    @IBAction func multiplication(_ sender: UIButton) {
        operation = "*"
        firstNumber = Double(myLabel.text!)
        isOperation = true
    }
    
    @IBAction func divide(_ sender: UIButton) {
        operation = "/"
        firstNumber = Double(myLabel.text!)
        isOperation = true
    }
    
    @IBAction func minus(_ sender: UIButton) {
        
        operation = "-"
        firstNumber = Double(myLabel.text!)
        isOperation = true
            
        
        
    }
    
    @IBAction func adding(_ sender: UIButton) {
        operation = "+"
        firstNumber = Double(myLabel.text!)
        isOperation = true
    }
    
    
    
    
    @IBAction func equal(_ sender: UIButton) {
        
        let secondNumber = Double(myLabel.text!)
        var result:Double?
        switch operation{
        case "*":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "+":
            result = firstNumber! + secondNumber!
        default:
            result = 0.0
        }
        myLabel.text = String(result!)
        isOperation = true
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        
        myLabel.text = "0"
        isOperation = true
    }
    
    var signPlus = true
    @IBAction func module(_ sender: UIButton) {
        if signPlus{
            let currentLabel = myLabel.text
            myLabel.text = "-" + currentLabel!
            isOperation = true
            signPlus = false
        }else{
            var currentLabel = Double(myLabel.text!)
            currentLabel = currentLabel! * (-1)
            myLabel.text = String(currentLabel!)
            isOperation = true
            signPlus = false
        }
    }
    
    
    @IBAction func percentage(_ sender: UIButton) {
        
        var currentNumber = Double(myLabel.text!)
        currentNumber = currentNumber! / 100
        myLabel.text = String(currentNumber!)
        isOperation = true
    }
    
    
    
}

