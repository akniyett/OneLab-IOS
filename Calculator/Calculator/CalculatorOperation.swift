//
//  CalculatorOperation.swift
//  Calculator
//
//  Created by Akniyet Turdybay on 16.03.2022.
//

import Foundation


enum Operation{
    case constants(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double, Double)->Double)
    case equal
}
struct CalculatorOperation{
    var operations:[String: Operation] = [
        "√": Operation.unaryOperation(sqrt)
    ]
    private var global_value:Double?
    mutating func setOperand(_ operand: Double){
        global_value = operand
    }
    mutating func performOperation(_ operation:String){
        let symbol = operations[operation]!
        switch symbol{
        case .constants(let value):
            global_value = value
        case .unaryOperation(let function):
            global_value = function(global_value!)
            
        default:
            break
        }
    }
    
    func getResult()->Double?{
        return global_value
    }
}
