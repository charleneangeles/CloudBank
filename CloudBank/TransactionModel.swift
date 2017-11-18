//
//  TransactionModel.swift
//  CloudBank
//
//  Created by Charlene Angeles on 11/17/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import Foundation

class TransactionModel {
    
    var Date: String?
    var Vendor: String?
    var Amount: String?
    
    init(Date: String?, Vendor: String?, Amount: String?){
        self.Date = Date
        self.Vendor = Vendor
        self.Amount = Amount
    }
}
