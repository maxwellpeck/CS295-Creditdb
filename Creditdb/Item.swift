//
//  Item.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//================================================================================================

class Item: NSObject, NSCoding {
    var name: String
    var valueInDollars: Int
    var cardNumber: String?
    let dateCreated: Date
    var bank: String
    var deleted: Bool
    var securityCode: String
    var expiration: Date
    
    //------------------------------------------------------------------------------------------------
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        cardNumber = aDecoder.decodeObject(forKey: "cardNumber") as! String?
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        bank = aDecoder.decodeObject(forKey: "bank") as! String
        deleted = false
        securityCode = aDecoder.decodeObject(forKey: "securityCode") as! String
        expiration = aDecoder.decodeObject(forKey: "expiration") as! Date
        super.init() }
    
    //------------------------------------------------------------------------------------------------
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(cardNumber, forKey: "cardNumber")
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
        aCoder.encode(bank, forKey: "bank")
        aCoder.encode(securityCode, forKey: "securityCode")
        aCoder.encode(expiration, forKey: "expiration")
    }
    
    //------------------------------------------------------------------------------------------------
    
    init(name: String, cardNumber: String?, valueInDollars: Int, deleted: Bool, bank: String, securityCode: String, expiration: Date) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.cardNumber = cardNumber
        self.dateCreated = Date()
        self.deleted = deleted
        self.bank = bank
        self.securityCode = securityCode
        self.expiration = expiration
        
        super.init()
    }
    
    //------------------------------------------------------------------------------------------------
    
    convenience init(new: Bool = false) {
        if new {
            
            self.init(name: "New Card",
                      cardNumber: "0000000000000000",
                      valueInDollars: 0, deleted: false, bank: "Bank Name", securityCode: "000", expiration: Date())
        } else {
            self.init(name: "", cardNumber: nil, valueInDollars: 0, deleted: false, bank: "", securityCode: "", expiration: Date())
        }
    }
}
