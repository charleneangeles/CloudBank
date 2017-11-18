//
//  AccountsViewController.swift
//  CloudBank
//
//  Created by Charlene Angeles on 11/15/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit
import Firebase

class AccountsViewController: UIViewController {

    @IBOutlet weak var btnLogOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        let vc = UIStoryboard(name: "nav", bundle: nil).instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: true)
        self.show(vc!, sender: nil)
    
    }
    

    

}
