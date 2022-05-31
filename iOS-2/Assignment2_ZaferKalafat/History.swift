//
//  History.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import Foundation

// I need my history class to collect items data
class History{
    var name : String?;
    var quantity : Int?;
    var TotalP : Double?;
    var PurchaseDate : String?;

    // call the constructor init method to provide values
    
    init(Name: String, Quantity: Int, Total : Double){
        
        // get current date and time when selected
        let currentDate = Date();
        let format = DateFormatter();
        format.dateFormat = "dd/MM/yyy HH:mm:ss"
        
        name = Name;
        quantity = Quantity;
        TotalP = Total
        PurchaseDate = format.string(from: currentDate)
        
    }
}
