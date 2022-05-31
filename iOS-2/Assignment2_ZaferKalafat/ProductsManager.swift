//
//  ProductsManager.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import Foundation

// create a class to manage products like the calculator manager logic

class ProductsManager{

    // collect products inside array [ ]
    var products : [Products] = [Products]();
    
    // init method to create the list and assign data then call it in VC
    // random clothing items
    init(){
    let Shirts : Products = Products(Name: "Shirts", Quantity: 80, Price: 5);
    
    let Shorts : Products = Products(Name: "Shorts", Quantity: 50, Price: 20)
    
    let Gloves : Products = Products(Name: "Gloves", Quantity: 20, Price: 10)
    
    // above declared products
    // call them and insert inside cells
    products.insert(Shirts, at: 0);
    products.insert(Shorts, at: 1);
    products.insert(Gloves, at: 2);
    }
    
    func AddProduct(name: String, quantity: Int, price: Double){
        products.append(Products(Name: name, Quantity: quantity, Price: price))
    }
}
