//
//  ManagerViewController.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/20/22.
//

import UIKit

class ManagerViewController: UIViewController {
    
    // declare the manager classes globally
    var manager : ProductsManager?
    var Historymanager : HistoryManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "Manager's Page"
        // Do any additional setup after loading the view.
    }
    
    // prepare the segue way
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "HistoryItems"{
            let destination = segue.destination as! HistoryViewController;
            
            destination.manager = manager;
            destination.Historymanager = Historymanager;
        }
        
        // otherwise it should be restock
        else if segue.identifier == "Restock"{
            let destination = segue.destination as! RestockViewController
            destination.manager = manager;
        }
    }

}
