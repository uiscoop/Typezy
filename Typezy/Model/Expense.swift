//
//  Expense.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import Foundation
import SwiftData

//MARK: To Avoid Duplicating use Unique Macro. & Speedup Queries by Index Macro

// Use #Unique<Expense>([\.person,\.itemName, \.createdTimeStamp])
// Use #Index<Expense>([[\.person],[\.itemName],[\.createdTimeStamp], [\.person,\.itemName,\.createdTimeStamp]])

@Model
final class Expense  {
    var person: String
    var amountSpent : Int
    var itemName: String
    var createdTimestamp: Date
    
    var image: Data?
    
    init(
        person: String = "for Myself",
        amountSpent: Int = 0,
        itemName: String = "",
        createdTimestamp: Date = .now
    ) {
        self.person = person
        self.amountSpent = amountSpent
        self.itemName = itemName
        self.createdTimestamp = createdTimestamp
        
    }
}

//MARK:// Log your Expenses.
// Spent \(80000) on \(iPhone 16) for myself.
// Spent \(240) on \(iPhoneCase) for myself.

//Spent \(120000) on \(Silver Jewellary) for TejroopClone
// Spent \(amountSpent) on \(itemName) for \(person)





