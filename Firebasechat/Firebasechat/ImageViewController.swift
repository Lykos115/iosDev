//
//  ImageViewController.swift
//  Firebasechat
//
//  Created by Mark Kinoshita on 10/14/19.
//  Copyright © 2019 Mark Kinoshita. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageDownload: UIImageView!
    @IBOutlet weak var imagePreview: UIImageView!
    var myImage:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func imageSelect(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
            self.present(vc, animated: true, completion: nil)
        } else {
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = .photoLibrary
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func imageUpload(_ sender: Any) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("users/\(uid)")
        guard let imageData = myImage!.jpegData(compressionQuality: 0.75) else { return
        }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                print("success")
                // success!
            } else {
                print("fail")
            }
        }
    }
    @IBAction func imageDownload(_ sender: Any) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        //Implement image download
    }
    @IBAction func clearImage(_ sender: Any) {
        imagePreview.image = nil
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
        // Get the image captured by the UIImagePickerController
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Do something with the images (based on your use case)
        imagePreview.image = selectedImage
        myImage = selectedImage
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
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
