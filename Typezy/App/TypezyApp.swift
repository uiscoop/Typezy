//
//  TypezyApp.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 25/11/24.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct TypezyApp: App {
    
    @State private var showLaunchView: Bool = true
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Expense.self,Event.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    

    var body: some Scene {
        WindowGroup {
            
            if showLaunchView == true {
                ZStack{
                    if showLaunchView{
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .top))
                    }
                }.zIndex(2.0)
            }else{
                ZStack{
                    //ContentView()
                    HomeScreen()
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    init() {
        try? Tips.resetDatastore()
        try? Tips.configure([
            .displayFrequency(.immediate)
        ])
    }
}
