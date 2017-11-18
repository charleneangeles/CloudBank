//
//  LoginViewController LoginViewController LoginViewController.swift
//  CloudBank
//
//  Created by Charlene Angeles on 11/15/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController_LoginViewController_LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!

    @IBAction func btnLogin(_ sender: UIButton) {
        if let email = txtEmail.text, let password = txtPassword.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                if user != nil{
                    
                    let vc = UIStoryboard(name: "accounts", bundle: nil).instantiateInitialViewController()
                    self.navigationController?.pushViewController(vc!, animated: true)
                    self.present(vc!, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "Login Failed", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result: UIAlertAction) -> Void in
                        print ("OK")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }

        }
    }
    
    override func touchesBegan(_ touches: Set <UITouch>, with even: UIEvent?){
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
}
