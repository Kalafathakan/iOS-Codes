//
//  DetailedHistoryViewController.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/24/22.
//

import UIKit

class DetailedHistoryViewController: UIViewController {

    @IBOutlet weak var HistoryDetail: UILabel!
    
    // call class objects
    var Historymanager : HistoryManager?
    var index : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // need to display data
    override func viewWillAppear(_ animated: Bool) {
        let name = Historymanager?.list[index].name;
        let price = Historymanager?.list[index].TotalP;
        let quantity = Historymanager?.list[index].quantity;
        let Date = Historymanager?.list[index].PurchaseDate;
        
        // keeps giving nil, could not figure out how to pull data
        HistoryDetail.text = "\(name) \n\(quantity) \n\(price) \n\(Date)\n"
    }

}
