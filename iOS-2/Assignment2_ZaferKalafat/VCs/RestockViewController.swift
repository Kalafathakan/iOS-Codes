//
//  RestockViewController.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/20/22.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var UserInput: UITextField!
    @IBOutlet weak var RestockTable: UITableView!
    
    var manager : ProductsManager?
    var index : Int = 0;
    var isValid = false;
    var isSelected = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager?.products.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = manager?.products[indexPath.row].name;
        cell.detailTextLabel?.text = String((manager?.products[indexPath.row].quantity)!);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row;
        isSelected = true;
        
    }
    func Reset(){
        UserInput.text = "";
    }
    @IBAction func CancelClicked(_ sender: Any) {
        Reset();
    }
    @IBAction func RestockClicked(_ sender: Any) {
        if isSelected{
            if let input: Int = Int(UserInput.text!){
                if input > 0 {
                    manager?.products[index].quantity = input;
                    isValid = true;
                    isSelected = false;
                }
                else {
                               let alert = UIAlertController(title: "Error", message: "Quantity cannot be 0 or smaller", preferredStyle: .alert)
                               let action = UIAlertAction(title: "okey", style: .default, handler: nil)
                               
                               alert.addAction(action)
                               
                               present(alert, animated: true, completion: nil)
                           }
                       }
                    }
                       // display error message user has to select product at the table
                       else{
                           let alert = UIAlertController(title: "Error", message: "First Select a product", preferredStyle: .alert)
                           let action = UIAlertAction(title: "okey", style: .default, handler: nil)
                           
                           alert.addAction(action)
                           
                           present(alert, animated: true, completion: nil)
                           
                       }
                       
                       RestockTable.reloadData()
                       // if it is not valid, display error message
                       if !isValid{
                       
                               let alert = UIAlertController(title: "Error", message: "Enter Quantity", preferredStyle: .alert)
                               let action = UIAlertAction(title: "okay", style: .default, handler: nil)
                               
                               alert.addAction(action)
                               
                               present(alert, animated: true, completion: nil)
                               
                           
                       }
                       isSelected = false;
                   }
                   
}
