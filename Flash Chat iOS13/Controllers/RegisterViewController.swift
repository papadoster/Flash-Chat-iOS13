//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: "\(e.localizedDescription)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                } else {
                    // Navigate to ChatViewController
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
}
