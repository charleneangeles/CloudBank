//
//  TransactionsViewController.swift
//  CloudBank
//
//  Created by Charlene Angeles on 11/15/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TransactionsViewController: UIViewController {
    
 

    @IBOutlet weak var TransactionsTableView: UITableView!
    
    @IBOutlet weak var btnLogOut: UIButton!
    
    var transactionList = [TransactionModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return transactionList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //the artist object
        let transaction: TransactionModel
        
        //getting the artist of selected position
        transaction = transactionList[indexPath.row]
        
        //adding values to labels
        cell.DateLabel.text = transaction.Date
        cell.LabelVendor.text = transaction.Vendor
        cell.LabelAmount.text = transaction.Amount
        
        //returning cell
        return cell
    }
    
    var refAccounts: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        
        refAccounts = Database.database().reference().child("Accounts")
        refAccounts.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.transactionList.removeAll()
                
                //iterating through all the values
                for transactions in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let transactionsObject = transactions.value as? [String: AnyObject]
                    let transactionsDate  = transactionsObject?["Date"]
                    let transactionsVendor  = transactionsObject?["Vendor"]
                    let transactionsAmount = transactionsObject?["Amount"]
                    
                    //creating arti4idst object with model and fetched values
                    let transaction = TransactionModel(Date: transactionsDate as! String?, Vendor: transactionsVendor as! String?, Amount: transactionsAmount as! String?)
                    
                    //appending it to list
                    self.transactionList.append(transaction)
                }
                
                //reloading the tableview
                self.TransactionsTableView.reloadData()
            }
        })
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

