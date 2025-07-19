//
//  EventView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        
        Text("Capture some Date Formatters here.")
        
        VStack(alignment: .center) {
            Text(Date().formatted())
            Text(Date().formatted(.iso8601))
            
            VStack (alignment: .trailing,spacing: 4){
                Text("Complete Time")
                    .font(.headline)
                    .underline()
                Text(Date().formatted(date: .abbreviated, time: .complete))
                Text(Date().formatted(date: .complete, time: .complete))
                Text(Date().formatted(date: .long, time: .complete))
                Text(Date().formatted(date: .numeric, time: .complete))
                Text(Date().formatted(date: .omitted, time: .complete))
                
                Text("Omitted Time")
                    .font(.headline)
                    .underline()
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                Text(Date().formatted(date: .complete, time: .omitted))
                Text(Date().formatted(date: .long, time: .omitted))
                Text(Date().formatted(date: .numeric, time: .omitted))
                Text(Date().formatted(date: .omitted, time: .omitted))
                
                Text("Shortened Time")
                    .font(.headline)
                    .underline()
                Text(Date().formatted(date: .abbreviated, time: .shortened))
                Text(Date().formatted(date: .complete, time: .shortened))
                Text(Date().formatted(date: .long, time: .shortened))
                Text(Date().formatted(date: .numeric, time: .shortened))
                Text(Date().formatted(date: .omitted, time: .shortened))
                
                Text("Standard Time")
                    .font(.headline)
                    .underline()
                Text(Date().formatted(date: .abbreviated, time: .standard))
                Text(Date().formatted(date: .complete, time: .standard))
                Text(Date().formatted(date: .long, time: .standard))
                Text(Date().formatted(date: .numeric, time: .standard))
                Text(Date().formatted(date: .omitted, time: .standard))
                
            }
            .background(.yellow.opacity(0.2))
            
 
        }
        .font(.headline.monospacedDigit())
    }
}

#Preview {
    EventView()
}
