//
//  PhotosManager.swift
//  Assignment3_ZaferKalafat
//
//  Created by user214082 on 3/27/22.
//

import Foundation
import UIKit

// I need classes to for title, image and All image Manager
// photo class to collect info
class Photos{
    var title : String = ""
    var image : UIImage?
    
    // my default init method
    init(Title: String, pic : UIImage){
        title = Title
        image = pic
    }
}

// same logic from week 10
// no need for another swift, just add the all images collection here
class AllPhotos{
    // same array application from the lecture
    public var allPics : [Photos] = [Photos]()
    // now add the photo data into all images collection
    public func addToCollection(title: String, pic : UIImage) {
        allPics.append(Photos(Title: title, pic: pic))
    }
}
