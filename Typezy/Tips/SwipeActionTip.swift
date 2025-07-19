//
//  SwipeActionTip.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import Foundation
import TipKit

struct SwipeActionTip : Tip{
    
    static let swipeActionEvent = Event(id: "swipeActionEvent")
    
    var options: [TipOption] {
        [
            Tips.MaxDisplayCount(1) , 
            Tips.IgnoresDisplayFrequency(true)
        ]
    }
    
    var title: Text {
        Text("Swipe Actions")
    }
    
    var message: Text? {
        Text("Swipe from trailing edge to delete.")
    }
    
    var image: Image?{
        Image(systemName: "trash")
    }
    
    var rules: [Rule] {
        [
            #Rule(Self.swipeActionEvent) { event in
                event.donations.count >= 1
            }
        ]
    }
}
