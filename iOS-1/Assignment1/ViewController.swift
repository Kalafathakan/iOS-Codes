//
//  ViewController.swift
//  Assignment1
//
//  Created by user214082 on 2/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserInput: UILabel!
    
    @IBOutlet weak var YellowButton: UIButton!
    
    @IBOutlet weak var ShowHistory: UITextView!
    
    // collect input
    var math : String = ""
    //call calculator
    var callclass : Calculator?
    // button title change
    var historyButton = true
    // call the array manager
    var manager : ArrayManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // call Calculator from delagate
        if let m = (UIApplication.shared.delegate as! AppDelegate).CalcObject{
            callclass = m
        }
        // same for the array manager class
        if let m = (UIApplication.shared.delegate as! AppDelegate).CalcManager{
            manager = m
        }
        ShowHistory.isHidden = true;
    }
    
    
    func clearHistory(){
        ShowHistory.text = ""
    }
    
    
    @IBAction func HistoryButton(_ sender: Any) {
        ShowHistory.text = ""
        
        // same logic from our lecture to change the name on click
        historyButton = !historyButton
        if historyButton{
            YellowButton.setTitle("Standard - No History", for: .normal)
            ShowHistory.backgroundColor = .lightGray
            ShowHistory.isHidden = false;
        }
        else{
            YellowButton.setTitle("Advance - With History", for: .normal)
            ShowHistory.backgroundColor = .white
            ShowHistory.isHidden = true;
        }
        // when advance is open print the array
        manager = ArrayManager()
    }
    
    
    @IBAction func Buttons(_ sender: Any) {
        if let TitleValue = (sender as! UIButton).titleLabel?.text{
            math = TitleValue
        }
        
        // when its equals
        if(math == "="){
            // get the calculation array from the calculator class
            callclass?.push(s: math)
            callclass?.calculate()
            print(callclass?.collectArray())
            // print the array on text label
            UserInput.text = callclass?.collectArray()
            if historyButton{
                // when advance is on show the saved arrays
                manager?.addNewCalculation(newCalculation: callclass!)
                // call it from the manager
                ShowHistory.text = manager?.collectArray()
                
            }
            callclass = Calculator()
            
        }
        // when clicked clear just clear everything
        else if(math == "C"){
            callclass?.clearArray()
            UserInput.text = callclass?.collectArray()
        }
        else{
            callclass?.push(s: math)
            UserInput.text = callclass?.collectArray()
        }
        
    }

}
