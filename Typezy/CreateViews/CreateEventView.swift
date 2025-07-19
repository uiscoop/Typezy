//
//  CreateEventView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import SwiftUI
import SwiftData

struct CreateEventView : View {
    
    let createEventTip : CreateEventTip
    let swipeActionTip : SwipeActionTip
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var event = Event()
    
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let notificationFeedbackGenerator = UINotificationFeedbackGenerator()

    var body: some View {
        
        //\(person)'s \(eventName) was on \(eventDate)
        
        Spacer()
        
        
        VStack{
            
            Text("Create an Event")
                .padding()
                //.border(Color.theme.accent)
                .font(.headline.monospaced())
                .fontWeight(.semibold)
            
            VStack{
                
                
                TextField("", text: $event.person)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    //.background(Color.theme)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
            
                TextField("Birthday,Anniversary, etc", text: $event.eventName)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                

                DatePicker("Date", selection: $event.eventDate,displayedComponents: .date)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                
//                TextField("Amount", value: $event.amountSpent , format: .currency(code: "INR"))
//                    .keyboardType(.decimalPad)
//                    .padding()
//                    .font(.headline.monospaced())
//                    .fontWeight(.semibold)
//                    .border(Color.theme.accent)
//                    .accentColor(Color.theme.accent)
               
                VStack{
                    Text("So, You Added \(event.person) \(event.eventName) on \(event.eventDate.formatted(date: .complete, time: .omitted)). ")
                    
                        .multilineTextAlignment(.center)
                        .font(.headline.monospaced())
                        .fontWeight(.semibold)
                        .accentColor(Color.theme.icon)
                    
                }
               
                
                VStack {
                    Button("Reset") {
                        //Dismissing the Sheet.
                        print("Reset Expense Button Tapped.")
                        withAnimation {
                            event.person = "Person's"
                            event.eventName = ""
                            event.eventDate = .now
                        }
                        notificationFeedbackGenerator.notificationOccurred(.warning)
                        
                    }
                    .frame(maxWidth:.infinity)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    .accentColor(Color.theme.accent)
                    //.border(Color.theme.button)
                    
                    Button("Create Event") {
                        //Dismissing the Sheet.
                        print("Create Event Button Tapped.")
                        withAnimation {
                            context.insert(event)
                        }
                        selectionFeedbackGenerator.selectionChanged()
                        dismiss()
                        createEventTip.invalidate(reason: .actionPerformed)
                        Task{
                            await SwipeActionTip.swipeActionEvent.donate()
                        }
                    }
                    .frame(maxWidth:.infinity)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    .background(.thinMaterial)
                    .accentColor(Color.theme.primaryText)
                    //.border(Color.theme.accent)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                }
//                Button("Create Expense") {
//                    //Dismissing the Sheet.
//                    print("Create Expense Button Tapped.")
//                    dismiss()
//                }
//                .padding()
//                .accentColor(Color.theme.icon)
//                .background(Color.theme.button)
//                //.clipped()
            }
            .padding()
            .cornerRadius(24)
            .background(Color.background)
            
            Spacer()
        }
        //.padding()
        .background(Color.theme.surfaceOne)
        
        
        
        Spacer()
    }

}

#Preview {
    CreateEventView(createEventTip: CreateEventTip(), swipeActionTip: SwipeActionTip() )
        .modelContainer(for:Event.self)
}
