//
//  HistoryManager.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import Foundation

// like product manager I need history items manager

class HistoryManager{
    // Initialize selected row info
    var index = 0;
    
    // check if the product is there
    var isValid : Bool = false;
    
    // need array like the other manager class
    // this time array in the history I am looking for
    var list : [History] = [History]();
    
    
    // check if product is there and if yes continue adding product to the list
    func isProduct (item : History) -> History{
        index = 0;
        for HistoryItem in list{
            if HistoryItem.name == item.name{
                isValid = true;
                
                let quantity : Int = HistoryItem.quantity!
                
                list.remove(at: index);
                
                item.quantity = item.quantity! + quantity;
              
            }
            index += 1
        }
        return item
    }
    
    // function to add new product
    func AddNewProduct(name: String, quantity: Int, price: Double){
        var history : History = History(Name: name, Quantity: quantity, Total: price);
        // check if its there from the other function
        history = isProduct(item: history);
        // now insert into the list where the index is
        list.insert(history, at: index)
    }
}
