//
//  Products.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import Foundation

// create class for products data
class Products{
    
    var name : String?;
    var quantity : Int?;
    var price : Double?;
    
    // call init method like history class
    init(Name : String, Quantity : Int, Price : Double){
        
        name = Name;
        quantity = Quantity;
        price = Price;
    }
}
