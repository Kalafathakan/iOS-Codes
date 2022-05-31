//
//  URLViewController.swift
//  Assignment3_ZaferKalafat
//
//  Created by user214082 on 3/26/22.
//

import UIKit

// create protocols to send the pic to the previous VC
protocol AddPicWithURL{
    func PicAddedWithURL(img : UIImage , title : String)
    func URLCancelled()
}

class URLViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var URLInput: UITextField!

    // variable of protocol
    var protokol : AddPicWithURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ClickedSave(_ sender: Any) {
        // get the title from textfield
        let title : String = titleInput.text!
        // get the url from textfield
        let link : String = URLInput.text!
                
            if (title == "" ){
                    
                // create alert message and display the error message
                let alert = UIAlertController(title: "Error", message: "Insert Title Please!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
                return
            }
                // referenced an example from stackeroverflow
                // create url object
                let Url = URL(string: link)
                
                DispatchQueue.global().async {
                // if url correct
                if let contents = try? Data(contentsOf: Url!){
                    // run it in main thread
                    DispatchQueue.main.async {
                        
                        // get the image
                        if let Pic : UIImage = UIImage(data: contents){
                            // need to call protokol to get my title and pic
                            
                            print("URL")
                            
                            self.protokol?.PicAddedWithURL(img: Pic, title: title)
                            
                        }
                        
                    }
                    
                    }
                    // if url not correct
                    else{
                        
                        DispatchQueue.main.async {
                        // Send alert box to the user when there is error
                        let alert = UIAlertController(title: "Error", message: "improper URL!", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                            
                        alert.addAction(action)
                            
                        self.present(alert, animated: true, completion: nil)
                            
                        }
                        
                    }
                    
                }
                
            }
    @IBAction func ClickedCancel(_ sender: Any) {
        
        // call back the protokol
               protokol?.URLCancelled()
               // close the current view
               dismiss(animated: true,completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
