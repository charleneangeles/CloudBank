//
//  TableViewCell.swift
//  CloudBank
//
//  Created by Charlene Angeles on 11/19/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    //labels connected
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var LabelVendor: UILabel!
    @IBOutlet weak var LabelAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
