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
    var deleted: Bool
    
    //------------------------------------------------------------------------------------------------
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        //        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        cardNumber = aDecoder.decodeObject(forKey: "cardNumber") as! String?
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        deleted = false
        super.init() }
    
    //------------------------------------------------------------------------------------------------
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        //        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(cardNumber, forKey: "cardNumber")
        aCoder.encode(valueInDollars, forKey: "valueInDollars") }
    
    //------------------------------------------------------------------------------------------------
    
    init(name: String, cardNumber: String?, valueInDollars: Int, deleted: Bool) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.cardNumber = cardNumber
        self.dateCreated = Date()
        self.deleted = deleted
        
        super.init()
    }
    
    //------------------------------------------------------------------------------------------------
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Discover", "Mastercard", "Visa"]
            let nouns = ["Credit", "Debit", "Gift Card"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomcardNumber = String(Int.random(in: 1000000000000000 ..< 10000000000000000))
            
            self.init(name: randomName,
                      cardNumber: randomcardNumber,
                      valueInDollars: randomValue, deleted: false)
        } else {
            self.init(name: "", cardNumber: nil, valueInDollars: 0, deleted: false)
        }
    }
}
