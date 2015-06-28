//
//  CardModel.swift
//  sample
//
//  Created by eunji park on 2015. 6. 27..
//  Copyright © 2015년 eunji park. All rights reserved.
//

import Foundation

enum CardDirection {
    case Forward
    case Reverse
}
class CardModel {
    var cardName:String!
    var cardNum:Int!
    var cardDirection:CardDirection!
    
    init() {
    }
    
    convenience init(cardName:String, cardNum:Int) {
        self.init();
        self.cardName = cardName;
        self.cardNum = cardNum;
        self.cardDirection = CardDirection.Forward;
    }
}