//
//  ViewController.swift
//  Assignment3_ZaferKalafat
//
//  Created by user214082 on 3/26/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, sendToMainPage {
    
    // create outlets to call in functions to update
    @IBOutlet weak var picViewer: UIImageView!
    @IBOutlet weak var TitlePicker: UIPickerView!
    
    // call all the pics collection in order to display
    var allphotos : AllPhotos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        allphotos = AllPhotos()
    }

    // now prepare for segue way
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check with identifier
        if(segue.identifier == "toSelectVC"){
            let selectVC = segue.destination as! SelectViewController
            selectVC.protokol = self
            
        }
    }
    
    // After save clicked send the title to the picker view
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return allphotos?.allPics[row].title
        }
    
    // roll the pickerview to refresh / change pics
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
            // display the pics inside the image viewer
            picViewer.image = allphotos?.allPics[row].image
        }
    
    // same code from week 10 to colelct number of components
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    // now I need how many rows in components
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return (allphotos?.allPics.count)!
        }
    
    // when a picture received from url VC
       func PicFromURL(img: UIImage, title: String) {
           
           // this add title and image to the collection array
           allphotos?.addToCollection(title: title, pic: img)
           
           // reload components from week 10
           DispatchQueue.main.async {
               self.TitlePicker.reloadAllComponents()
           }
           print("MAIN")
          // once pic is received redirect to main page and demonstrate
           navigationController?.popToRootViewController(animated: true)
           // auto close the last VC
          dismiss(animated: true, completion: nil)
       }
    
       // If cancel clicked
       func cancelURL() {
           
           // redirect auto back to main page right away without saving anything
           DispatchQueue.main.async {
               self.TitlePicker.reloadAllComponents()
           }
           
          // back to main page
           navigationController?.popToRootViewController(animated: true)
           // auto close the last VC
          dismiss(animated: true, completion: nil)
       }
    
    // call protocol function when pic is being received from the local gallery
        func PicFromCamera(img: UIImage, title: String) {
            
            // insert title and pic to the collection
            allphotos?.addToCollection(title: title, pic : img)
            // reload the picker
            DispatchQueue.main.async {
                self.TitlePicker.reloadAllComponents()
            }
            // display the root view controller
            navigationController?.popToRootViewController(animated: true)
            dismiss(animated: true, completion: nil)
            
        }
    
        // now when cancel is clicked follow similar steps like URL code above
        func cancelCamera() {
            DispatchQueue.main.async {
                self.TitlePicker.reloadAllComponents()
            }
            // back to main page
            navigationController?.popToRootViewController(animated: true)
           dismiss(animated: true, completion: nil)
        }
}

