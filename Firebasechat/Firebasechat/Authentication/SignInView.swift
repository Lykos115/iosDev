//
//  SignInView.swift
//  Firebasechat
//
//  Created by Mark Kinoshita on 10/9/19.
//  Copyright © 2019 Mark Kinoshita. All rights reserved.
//

import UIKit
import Firebase


class SignInView: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil {
                print("success")
                self.performSegue(withIdentifier: "toHome", sender: nil)
            } else {
                print("error")
            }
        }
    }
}
