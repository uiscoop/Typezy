//
//  CreateExpenseTip.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import Foundation
import TipKit

struct CreateExpenseTip : Tip {
    var title: Text {
        Text("Create your first Expense here.")
    }
    
    var message: Text? {
        Text("Tap on this button to Create your first Expense")
    }
    
    var image: Image? {
        Image(systemName: "indianrupeesign.gauge.chart.leftthird.topthird.rightthird")
    }

    
}
