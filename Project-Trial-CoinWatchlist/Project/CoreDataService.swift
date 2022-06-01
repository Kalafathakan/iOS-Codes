//
//  CoreDataService.swift
//  Project
//
//  Created by user214082 on 4/16/22.
//

import Foundation
import CoreData

class CoreDataService{
    static var Shared = CoreDataService()
    
    func insertCoinIntoStorage(name: String, symbol: String, marketData: Double, currentPrice: Double, priceChangePercentage24H: Double){
        
        let newCoin = Crypto(context: persistentContainer.viewContext)
        newCoin.name = name
        newCoin.symbol = symbol
        newCoin.marketdata = marketData
        newCoin.currentPrice = currentPrice
        newCoin.pricechangepercentage = Double(priceChangePercentage24H)
        
        saveContext()
        
    }
    
    func getAllCoinsFromStorage() -> [Crypto]{
        var result = [Crypto]()
        let cryptoFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Crypto")
        do{
            result = try(persistentContainer.viewContext.fetch(cryptoFetch) as? [Crypto])!
            print(result.count)
        }catch{
            print(error)
        }
        return result
    }
    // delete from core data
    func deleteFromStorage(toDelete: Crypto){
        persistentContainer.viewContext.delete(toDelete)
        saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoinDataModel")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            
            if let error = error as NSError?{
                fatalError("Unresolved error\(error), \(error.userInfo)")
            }
            
        })
        return container
    }()
    
    func saveContext(){
        
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
