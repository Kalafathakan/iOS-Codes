//
//  Calculator.swift
//  Assignment1
//
//  Created by user214082 on 2/8/22.
//

import Foundation

class Calculator{
    
    // collect the users input in an array
    var inputArray : [String] = []
    // initialize the result
    var result : Int = 0
    //global boolean
    var isValid : Bool = true
    var isOperators : Bool = false
    var isNumbers : Bool = false
    
    init(){
        
    }
    
 
    // hint from the pdf
    func push(s:String){
        inputArray.append(s)
        
    }
    
    func collectArray() -> String{
        var ArrayResult : String = ""
        for element in inputArray{
            ArrayResult += element
        }
        return ArrayResult
    }
    
    // main function to do the calculation with switch approach
    func calculate(){
        var index : Int = 0
        
        result = Int(inputArray[index])!;
        index += 1
        
        while(index < inputArray.count){
            
            switch inputArray[index]{
                
            case "+":
                index += 1
                result += Int(inputArray[index])!
                
            case "-":
                index += 1
                result -= Int(inputArray[index])!
                
            case "*":
                index += 1
                result *= Int(inputArray[index])!
                
            case "/":
                index += 1
                result /= Int(inputArray[index])!
                
            default:
                index += 1
            }
            
        }
        print(result)
        let m : String = String (result)
        print(m)
        push(s: m)
        
    }
    
    func clearArray(){
        
        inputArray.removeAll()
        
    }
    
  
        


    }
