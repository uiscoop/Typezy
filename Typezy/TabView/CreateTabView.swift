//
//  CreateTabView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import SwiftUI
import SwiftData
import TipKit

struct CreateTabView: View {
    
    @State private var showEventSheet: Bool = false
    
    let createExpenseTip  = CreateExpenseTip()
    let createEventTip = CreateEventTip()
    let swipeActionTip = SwipeActionTip()
    
    @State private var showExpenseSheet : Bool = false
    
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    var body: some View {
        VStack{
            Button {
                print("User Tapped on Add Expense Button.")
                showExpenseSheet.toggle()
                selectionFeedbackGenerator.selectionChanged()
            } label: {
                HStack(alignment: .center, spacing:8){
                    Image(systemName: "plus")
                    Text("Create Expense")
                        .font(.headline.monospaced())
                        .fontWeight(.semibold)
                }
                .padding()
                .background(.thinMaterial)
                .accentColor(Color.theme.primaryText)
                //.border(Color.theme.accent)
                .clipShape(.buttonBorder)
                .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                .sheet(isPresented: $showExpenseSheet, content: {
                    CreateExpenseView(createExpenseTip: createExpenseTip, swipeActionTip : swipeActionTip)
                        .presentationDetents([.large])
                        .edgesIgnoringSafeArea(.bottom)
                })
                .popoverTip(createExpenseTip, arrowEdge: .bottom)
            }
            Button {
                print("User Tapped on Add Event Button.")
                // Sheet for Evnts
                showEventSheet.toggle()
                selectionFeedbackGenerator.selectionChanged()
            } label: {
                HStack(alignment: .center, spacing:8){
                    Image(systemName: "plus")
                    Text("Save an Event Date")
                        .font(.headline.monospaced())
                        .fontWeight(.semibold)
                }
                .padding()
                .background(.thinMaterial)
                .accentColor(Color.theme.primaryText)
                //.border(Color.theme.accent)
                .clipShape(.buttonBorder)
                .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                .sheet(isPresented: $showEventSheet, content: {
                    CreateEventView(createEventTip: createEventTip, swipeActionTip : swipeActionTip)
                        .presentationDetents([.large])
                        .edgesIgnoringSafeArea(.bottom)
                })
            }
            
        }
    }
    
    
}

#Preview {
    CreateTabView()
}
