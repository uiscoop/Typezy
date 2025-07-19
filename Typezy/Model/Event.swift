//
//  Event.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import Foundation
import SwiftData




@Model
final class Event {
    var person: String
    var eventName: String
    var eventDate: Date
    
    init(
        person: String = "Person's",
        eventName: String = "",
        eventDate: Date = .now
    ) {
        self.person = person
        self.eventName = eventName
        self.eventDate = eventDate
        
    }
}


// \(person)'s \(eventName) was on \(eventDate)
// Tejroop's Birthday was on 22-January-1998
// Halleyna's Anniversary is on 22-November-2022

//MARK:// Save your Dates.
// Tejroop Birthday was on 22 January 1998.
// \(person) \(lifeEvent) happened on \(lifeEventDate)

// Vineela Marriage was on 22 September 2010.
// \(person) \(lifeEvent) happened on \(lifeEventDate)

//MARK:// Save your Dates.
