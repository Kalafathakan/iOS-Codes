//
//  CameraViewController.swift
//  Assignment3_ZaferKalafat
//
//  Created by user214082 on 3/26/22.
//

import UIKit

//create protocols to send the pic to the previous VC
protocol AddPicWithCamera{
    func PicAddedFromCamera(img : UIImage , title : String)
    func CameraCancelled()
}

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var picViewer: UIImageView!
    
    // declare protcol variable
        var protokol : AddPicWithCamera?
        // declare variable for UIImage
        var Pic : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ClickedCameraButton(_ sender: Any) {
        
        // declare the variable then establish connection to get inside gallery
        let gallery = UIImagePickerController()
        // declare the source
        gallery.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera :.photoLibrary
        gallery.allowsEditing = false;
        gallery.delegate = self
        // show the selected pic
        present(gallery, animated: true,completion: nil)
    }
    
    // once pic is selected get it and pass it through
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
           // get the pic
           if let img = info[.originalImage] as? UIImage
           {
               // show pic in image viewer
               Pic = img
               picViewer.image = img
               
           }
           // close the gallery so you can click save and send it through
           dismiss(animated: true, completion: nil)
       }
       // when cancel clicked just go back to main and do not pass pic
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
           // close the current view
           dismiss(animated: true, completion: nil)
       }
    
    @IBAction func ClickedSave(_ sender: Any) {
        // prepare protocol to send the pic and title the Select VC
                if (Pic != nil){
                    // save under local image name as shown in your example video
                    protokol?.PicAddedFromCamera(img: Pic!, title: "local image")
                    
                }else{
                    // validate if there is pic, if not
                    // send error message
                    let alert = UIAlertController(title: "Error", message: "Must add image before saving!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
        
    }
    
    @IBAction func ClickedCancel(_ sender: Any) {
        // cancel and go back to main
               protokol?.CameraCancelled()
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
