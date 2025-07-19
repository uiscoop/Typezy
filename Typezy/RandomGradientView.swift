//
//  RandomGradientView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 30/11/24.
//

import SwiftUI

struct RandomGradientView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.ultraThinMaterial)
                .border(.red)
                
            Label("Calendar", systemImage: "calendar")
                .font(.title).monospaced()
            
        }
        .padding()
        .background(.ultraThickMaterial)
       
    }
}

#Preview {
    RandomGradientView()
}
