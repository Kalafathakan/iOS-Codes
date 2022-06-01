//
//  CoinModel.swift
//  Project
//
//  Created by user214082 on 4/12/22.
//

import Foundation

class Coin: Identifiable, Codable {
    
    // variables in the api are created in this class
    let id, symbol, name: String
    let image: Image
    let market_data: MarketData
    let price_change_percentage_24h: PricePer24H
    
}

class Image: Codable{
    var large : String = ""
}

class MarketData: Codable{
    var current_price : CurrentPrice = CurrentPrice()
    
    
}

class PricePer24H: Codable{
    var price_change_percentage_24h : Double = 0.0
}

class CurrentPrice: Codable{
    var usd : Double = 0.0
}

// same logic from week 10
// addCollection method needed in here
class CoinCollection : Codable{
    // after array declared
    var allCoins : [Coin] = [Coin]()
    
}
