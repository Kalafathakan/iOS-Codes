//
//  ViewController.swift
//  Project
//
//  Created by user214082 on 4/12/22.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, networkingDelegateProtocole {
    
        
    func coinDownloadedCorrectly(image: UIImage) {
        DispatchQueue.main.async {
            self.image.image = image
        }
    }
    
    func coinDidNotDownloadedCorrectly() {
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            getNewCoin(coinName: coins[row])
        }
            
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rows = 0
        if pickerView.tag == 1{
            rows = coins.count
        }else{
            rows = result.allCoins.count
        }
        return rows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var title = ""
        if pickerView.tag == 1 {
            title = coins[row]
        } else {
            title = result.allCoins[row].id
        }
        return title
    }

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var coinPicker: UIPickerView!
    
    var currentCoinCollection : CoinCollection?
    
    var result : CoinCollection = CoinCollection()
    
    var coins = ["bitcoin", "ethereum"]
    
    var coinName : String = ""

    // apply getter and setter logic
    
    func getNewCoin(coinName: String){
        NetworkService.Shared.getCoinDataFromURL(coinName: coinName){
            result in switch result {
            case.success(let coinCollection) : DispatchQueue.main.async {
                self.currentCoinCollection = coinCollection
                self.result = coinCollection
                self.coinPicker.reloadAllComponents()
                
            }
                break
            case .failure(_): break
                
            }
        }
    }
    
    // now save and set the coin
    @IBAction func saveNewCoin(_ sender: Any) {
        
        let alert = UIAlertController.init(title: "Are you sure?", message: "Do you want to add this coin?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler:{
            action in
            let coinIndex = self.coinPicker.selectedRow(inComponent: 0)
            let currentCoin = self.currentCoinCollection?.allCoins[coinIndex]
            let coinName = self.coins[self.coinPicker.selectedRow(inComponent: 0)]
           
            
            CoreDataService.Shared.insertCoinIntoStorage(name: coinName, symbol: coinName, marketData: Double(coinIndex), currentPrice: Double(coinIndex), priceChangePercentage24H: Double(coinIndex))
            
        }))
        
        present(alert, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getNewCoin(coinName: "bitcoin")
    }
}

