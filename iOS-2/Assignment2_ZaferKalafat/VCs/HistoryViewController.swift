//
//  HistoryViewController.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/25/22.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var HistoryTable: UITableView!
    
    var manager : ProductsManager?
    var Historymanager : HistoryManager?
    
    // initialize the index number for selected row
    var index : Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Historymanager?.list.count)!;
        
    }
    

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableCell
        
        cell.ItemName.text = Historymanager?.list[indexPath.row].name;
        
        cell.ItemQuantity.text = String((Historymanager?.list[indexPath.row].quantity)!);

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        HistoryTable.reloadData()
        navigationItem.backButtonTitle = "History Items";
    }
    
    // pressed item needs to be sent to the other page
     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
             index = indexPath.row
             return indexPath;
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "historyDetail"{
            let destination = segue.destination as! DetailedHistoryViewController
            
            destination.index = index;
        }
    }
}
