//
//  SignUpView.swift
//  Firebasechat
//
//  Created by Mark Kinoshita on 10/9/19.
//  Copyright © 2019 Mark Kinoshita. All rights reserved.
//

import UIKit
import Firebase

class SignUpView: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpAction(_ sender: Any) {
        
        guard let password = passwordField.text else { return }
        guard let email = emailField.text else  { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            
            if error == nil {
                print("user create")
            } else {
                print("failed ")
            }
            
        }
    }
}
