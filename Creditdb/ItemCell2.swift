//
//  ItemCell.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//====================================================================================================

//ItemCell2 Class: Used if card (Item) is not marked as a credit card
class ItemCell2: UITableViewCell {
    
    //------------------------------------------------------------------------------------------------
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bankAndExpDate: UILabel!
    
    //------------------------------------------------------------------------------------------------
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        bankAndExpDate.adjustsFontForContentSizeCategory = true
    }
    
    //------------------------------------------------------------------------------------------------
    
}
