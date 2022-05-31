//
//  SelectViewController.swift
//  Assignment3_ZaferKalafat
//
//  Created by user214082 on 3/26/22.
//

import UIKit

// establish protocol to push info back to root
protocol sendToMainPage{
    // functions to collect pic from URL VC
    func PicFromCamera(img : UIImage , title : String)
    func cancelCamera()
    // functions to collect pic from Camera VC
    func PicFromURL(img : UIImage , title : String)
    func cancelURL()
    
}

class SelectViewController: UIViewController, AddPicWithURL, AddPicWithCamera{

    // call protocol variable
    var protokol:sendToMainPage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // prepare for segue way
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // if segue is for url process
            if(segue.identifier == "toURL"){
                // check if it is passing actually
                print("To URL")
            // set the protocol for url view controller
            let URLVC =   segue.destination as! URLViewController

            URLVC.protokol = self
                
                }
            
            // if segue for library process
            if(segue.identifier == "toCamera"){
                // check to see if it is passing
                print("to Camera")
                
            // set the protocol for library view controller
            let CameraVC = segue.destination as! CameraViewController
                CameraVC.protokol = self}
            
        }
    
    // URL protocol called when pic received from URL VC
        func PicAddedWithURL(img: UIImage, title: String) {
            // call it again in main page VC so it can be passed and displayed
            
            print("SELECT")
            
            protokol!.PicFromURL(img : img , title : title)
            
            // close
            dismiss(animated: true,completion: nil)
        }
    
        // opposite of the above, now cancel it and get back to main page
        func URLCancelled() {
            // call it in main page VC
            protokol?.cancelURL()
            // close
            dismiss(animated: true,completion: nil)
        }
    
        // Now for the Camera VC part
        func PicAddedFromCamera(img: UIImage, title: String) {
        
            protokol?.PicFromCamera(img: img, title: title)
            // close
            dismiss(animated: true,completion: nil)
            
        }
        // now the opposite for camera
        func CameraCancelled() {
            
            protokol?.cancelCamera()
            // close 
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
