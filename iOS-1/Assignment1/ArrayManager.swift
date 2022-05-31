//
//  ArrayManager.swift
//  Assignment1
//
//  Created by user214082 on 2/8/22.
//

import Foundation

class ArrayManager{
    var calculations : [Calculator] = [Calculator]()
    
    func addNewCalculation(newCalculation : Calculator){
        calculations.append(newCalculation)
    }
    
    func collectArray() -> String{
        var result : String = ""
        
        for calculate in calculations{
            for element in calculate.inputArray{
                result += element
            }
            result += "\n"
        }
        return result
    }
    
}
