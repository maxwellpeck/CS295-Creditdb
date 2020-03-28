//
//  Item.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//================================================================================================

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var cardNumber: String?
    let dateCreated: Date
    
    //------------------------------------------------------------------------------------------------
    
    init(name: String, cardNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.cardNumber = cardNumber
        self.dateCreated = Date()
        
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
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", cardNumber: nil, valueInDollars: 0)
        }
    }
}
