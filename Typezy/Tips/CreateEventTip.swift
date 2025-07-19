//
//  CreateEventTip.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import Foundation
import TipKit

struct CreateEventTip : Tip {
    var title: Text {
        Text("Create your first Event here.")
    }
    
    var message: Text? {
        Text("Tap on this button to Create your first Event")
    }
    
    var image: Image? {
        Image(systemName: "calendar.badge.plus")
    }

    
}
