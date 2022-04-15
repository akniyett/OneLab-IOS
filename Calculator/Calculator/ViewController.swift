//
//  ViewController.swift
//  Calculator
//
//  Created by Akniyet Turdybay on 09.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberLabel: UILabel!
    
    
    var isOperation = false
    var canType = false
    var isDot = false
    @IBAction func buttonClick(_ sender: UIButton) {
        var currentDigit = sender.currentTitle!
        let currentLabel = numberLabel.text!
        
        if currentLabel.contains(".") && currentDigit == "."{
            currentDigit = ""
        }
        else if isOperation{
            currentDigit = ""
            isOperation = false
        }
        else if currentLabel != "0" && canType{
            let zeroNumber = numberLabel.text!
            numberLabel.text = zeroNumber + currentDigit
        }
        else{
            numberLabel.text = currentDigit
            canType = true
            
        }
        
    }
    
    var displayValue:Double{
        get{
            return Double(numberLabel.text!)!
        }
        set{
            numberLabel.text = String(newValue)
        }
    }
    private var calcOperation = CalculatorOperation()
    @IBAction func operationPressed(_ sender: UIButton) {
        calcOperation.setOperand(displayValue)
        calcOperation.performOperation(sender.currentTitle!)
        displayValue = calcOperation.getResult()!
        isOperation = true
    }
    
    
    
    

}

