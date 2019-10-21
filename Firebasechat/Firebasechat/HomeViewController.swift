//
//  HomeViewController.swift
//  Firebasechat
//
//  Created by Mark Kinoshita on 10/9/19.
//  Copyright © 2019 Mark Kinoshita. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    let user = Auth.auth().currentUser
    let userID = Auth.auth().currentUser?.uid
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
             view.addGestureRecognizer(tap)
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func readAction(_ sender: Any) {
        ref.child("Users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let message = value?["userMessage"] as? String ?? ""
            self.messageLabel.text = message
            print("read")
        }) { (error) in
           
            print("not working")
            
        }
    }
        @IBAction func postAction(_ sender: Any) {
            //Safe grab the user info
            guard let ID = userID else { return }
            guard let input = inputField.text else { return }
            //Push to database
            self.ref?.child("Users").child(ID).setValue(["userMessage":input])
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
