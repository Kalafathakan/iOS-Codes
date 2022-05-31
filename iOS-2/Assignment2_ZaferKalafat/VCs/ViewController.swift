//
//  ViewController.swift
//  Assignment2_ZaferKalafat
//
//  Created by user214082 on 2/20/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var LabelType: UILabel!
    
    @IBOutlet weak var LabelTotal: UILabel!
   
    @IBOutlet weak var LabelQuantity: UILabel!
    
    @IBOutlet weak var MainTable: UITableView!
    
    // now call the objects
    var manager : ProductsManager?;
    var Historymanager : HistoryManager?;
    
    // declare variables for name, quantity and price data
    var quantityInput : String = "";
    // initializing 0 did not work since its default
    var PressedProduct : Int = -1;
    var isPressed : Bool = false;
    var TotalPrice : Double = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call the class from appdelegate
        // same logic from assignment 1
        if let m = (UIApplication.shared.delegate as! AppDelegate).manager{
            manager = m;
        }
        if let m = (UIApplication.shared.delegate as! AppDelegate).Historymanager {
            Historymanager = m;
        }
    }
    
    // prepare for segue way inherited from lecture
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toManager"{
            let destination = segue.destination as! ManagerViewController
            destination.manager = manager;
            destination.Historymanager = Historymanager;
        }
    }
    
    // Load the table onLoad
    override func viewWillAppear(_ animated: Bool) {
        MainTable.reloadData();
    }
    
    // I need to first display my products
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // call products data from manager class and instert into corresponding labels inside the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableCell
        cell.TableName.text = manager?.products[indexPath.row].name;
        cell.TableQuantity.text = String((manager?.products[indexPath.row].quantity)!);
        cell.TablePrice.text = String((manager?.products[indexPath.row].price)!);
        print(String((manager?.products[indexPath.row].price)!))
        return cell;
    }
    
    // now set row number depending on product count here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager?.products.count)!
    
    }
    
    // Get the pressed row and pull data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LabelType.text = manager?.products[indexPath.row].name;
        //LabelQuantity.text = String((manager?.products[indexPath.row].quantity)!);
        //LabelTotal.text = String((manager?.products[indexPath.row].price)!);
        //LabelQuantity.text = quantityInput;
        //LabelTotal.text = String(TotalPrice);
        PressedProduct = indexPath.row;
        isPressed = true;
    }
    
    @IBAction func ButtonClicked(_ sender: Any) {
    
    // same logic from calculator app however instead of creating a class I wrote it here to keep it simple
    // get titles of buttons as values
    // variable to hold button title name
            var buttonTitle : String = "";
            // get the button name and assign to the variable
    if let title = (sender as! UIButton).titleLabel?.text{
                buttonTitle = title;
                
    }
            // switch method to assign values
            switch(buttonTitle){
            case "0","1","2","3","4","5","6","7","8","9" :
                quantityInput += buttonTitle;
                break;
            default:
                break;
                
            }
        print(quantityInput)
            // User needs to first select product then give quantity
            // if pressed and quantity not empty carry on
            if isPressed && !quantityInput.isEmpty {
                print(isPressed)
            LabelQuantity.text = quantityInput;
                // Calculate the total price from the provided formula
                TotalPrice = Double(quantityInput)!*(manager?.products[PressedProduct].price)!
            // display the amount in the label now
                print(Double(quantityInput)!*(manager?.products[PressedProduct].price)!)
                LabelTotal.text = String(TotalPrice);
            }
            
            else{
                // update the quantity from given input
                quantityInput = "";
                // if no selection and quantity entry show error
                let alert = UIAlertController(title: "Error", message: "Select a product from the table and enter quantity!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
            }
            // if pressed buy check if values are there
            if buttonTitle == "Buy"{
          
                // after selection must provide quantity
                if PressedProduct > -1 && !quantityInput.isEmpty && isPressed{
                    // collect products quantity from manager class
                    var ProductQuantity : Int = (manager?.products[PressedProduct].quantity)!;
                
                    // after purchase minus the user quantity input from original quantity
                    ProductQuantity -= Int(quantityInput)!;
                    
                    // if user tries to buy more than given quantity show error
                    if ProductQuantity < 0 {
                        // display error message
                        let alert = UIAlertController(title: "Error", message: "Quantity cannot be bigger than original number", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                        
                        alert.addAction(action)
                        
                        present(alert, animated: true, completion: nil)
                        
                        Reset();
                        
                    }
                    else{
                        // first display pressed product name
                        let Name = manager?.products[PressedProduct].name;
                        // then get user input for quantity
                        let Quantity = Int(quantityInput);
                        // update the original object
                        Historymanager?.AddNewProduct(name: Name!, quantity: Quantity!, price: TotalPrice)
                        
                        manager?.products[PressedProduct].quantity = ProductQuantity;
                        // clear labels auto after each purhcase
                        Reset();

                }
            }
        }
    }
    // call reset function so after user input it will reseted
    func Reset(){
        //set everything back initials after a purchase completed
        MainTable.reloadData();
        LabelType.text = "Type";
        LabelQuantity.text = "Quantity";
        LabelTotal.text = "Tootal";
        quantityInput = "";
        isPressed = false;
    }


}
