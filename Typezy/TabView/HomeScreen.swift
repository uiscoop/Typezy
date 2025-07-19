//
//  HomeScreen.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import SwiftUI
import SwiftData
import TipKit

struct HomeScreen: View {
    
    let now = Date()
    let calendar = Calendar.current
    
    @Environment(\.dismiss) var dismiss
    
    //@State private var showHapticSheet: Bool = false
    
    //let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    @State var tabSelection = 1
    @State private var searchQuery: String = ""
    
    var body: some View {
        
        
        NavigationView {
            
            TabView(selection: $tabSelection) {
                
                //MARK: This is for Expense List.
                ExpenseListTabView()
                    .tag(0)
                    .tabItem {
                        Image(systemName: "indianrupeesign.gauge.chart.leftthird.topthird.rightthird")
                            .symbolRenderingMode(.hierarchical)
                            .symbolEffect(.bounce.up.byLayer, options: .nonRepeating)
                        Text("Expense List")
                    }
                    .onTapGesture {
                        print("Expense List Tab Pressed.")
                        selectionFeedbackGenerator.selectionChanged()
                    }

                //MARK: This is for TWO Buttons.
                CreateTabView()
                    .tag(1)
                    .tabItem {
                        Image(systemName:"plus.diamond")
                            .symbolEffect(.bounce.up.byLayer, options: .nonRepeating)
                        Text("Add")
                        
                    }
                    .onTapGesture {
                        print("Add Tab Pressed.")
                        selectionFeedbackGenerator.selectionChanged()
                    }
                
                //MARK: This is for Event List.
                EventListTabView()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "calendar")
                            .symbolEffect(.bounce.up.byLayer, options: .nonRepeating)
                        Text("Event List")
                    }
                    .onTapGesture {
                        print("Event List Tab Pressed.")
                        selectionFeedbackGenerator.selectionChanged()
                    }
                
            }
            .sensoryFeedback(SensoryFeedback.selection, trigger: tabSelection)
            .accentColor(Color.theme.accent)
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchQuery, prompt: "Search for User / Expenses")
        

    }

}


#Preview {
    HomeScreen()
        .modelContainer(for: [Expense.self ,Event.self], inMemory: true)
}


//MARK: Button Background

// background is thinMaterial , accentcolor is primary text , border is


//.background(.thinMaterial)
//.accentColor(Color.theme.primaryText)
//.border(Color.theme.accent)
