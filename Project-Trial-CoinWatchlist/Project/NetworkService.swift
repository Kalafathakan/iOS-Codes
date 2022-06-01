//
//  NetworkService.swift
//  Project
//
//  Created by user214082 on 4/12/22.
//

import Foundation
import UIKit

// add the protocol
protocol networkingDelegateProtocole{
    func coinDownloadedCorrectly(image:UIImage)
    func coinDidNotDownloadedCorrectly()
}

class NetworkService{
    
    var delegate : networkingDelegateProtocole?
    
    static var Shared = NetworkService()
    
    
    func getCoinDataFromURL(coinName: String, completionHandler: @escaping (Result <CoinCollection, Error>) -> Void){
        
        let url = "https://api.coingecko.com/api/v3/coins/\(coinName)?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        let urlObj = URL(string: url)!
                   
                let task = URLSession.shared.dataTask(with: urlObj)
                    { data, response, error in
                           guard error == nil else {
                               completionHandler(.failure(error!))
                               return
                           }
                           guard let httpRespons = response as? HTTPURLResponse, (200...299).contains(httpRespons.statusCode) else {
                               print ("Incorrect response ")
                                                      return
                           }
                           
                if let jsonData = data {
                                   print(jsonData)
                    let decoder =  JSONDecoder()
                               do {
                    let result = try decoder.decode(CoinCollection.self, from: jsonData)
                                   completionHandler(.success(result))
                               }
                               catch {
                                   print (error)
                               }
                           }
                       }
                       task.resume()
    }
    
    // I would like to just get coin Image present market data in coinDetailVC when selected from TableView
    
    func getImage(url:String, completionHandler : @escaping (Result <UIImage, Error>) -> Void){
        
        let urlObj = URL(string: url)!
                   
                let task = URLSession.shared.dataTask(with: urlObj)
                    { [self]data, response, error in
                           guard error == nil else {
                               self.delegate?.coinDidNotDownloadedCorrectly()
                               return
                           }
                           guard let httpRespons = response as? HTTPURLResponse, (200...299).contains(httpRespons.statusCode) else {
                               print ("Incorrect response ")
                                                      return
                           }
                           // I want to just show the picture of the crypto coin to the user
                        // when coin is added to favorites, click on from TableView
                        // and coinDetailsVC should present the market data of the coin
                if let imageData = data {
                    let image = UIImage(data:imageData)
                    self.delegate?.coinDownloadedCorrectly(image: image!)
                           }
                       }
                       task.resume()
    }
}
