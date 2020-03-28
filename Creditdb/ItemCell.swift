//
//  ItemCell.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//====================================================================================================

class ItemCell: UITableViewCell {
    
    //------------------------------------------------------------------------------------------------
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cardNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    //------------------------------------------------------------------------------------------------
    
    override func awakeFromNib() {
    super.awakeFromNib()
        
    nameLabel.adjustsFontForContentSizeCategory = true
        cardNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
    //------------------------------------------------------------------------------------------------
    
}
