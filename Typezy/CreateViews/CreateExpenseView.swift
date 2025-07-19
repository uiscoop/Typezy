//
//  CreateExpenseView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct CreateExpenseView: View {
    
    let createExpenseTip : CreateExpenseTip
    let swipeActionTip : SwipeActionTip
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var expense = Expense()
    
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    
    @State var selectedPhoto : PhotosPickerItem?
    //@State var selectedPhotoData : Data?

    var body: some View {
        
        //Spent \(amountSpent) on \(itemName) for \(person)
        //Spent 30000 for MacBook on 22 January 2016 for myself
        //Spent \(amountSpent) for \(itemName) on \(date) for \(person)
        
        Spacer()
        
        
        VStack{
            
            Text("Create an Expense")
                .padding()
                //.border(Color.theme.accent)
                .font(.headline.monospaced())
                .fontWeight(.semibold)
            
            VStack{
                TextField("Expense Name", text: $expense.itemName)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    //.background(Color.theme)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                
                TextField("for Myself", text: $expense.person)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                

                DatePicker("Date", selection: $expense.createdTimestamp)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                
                
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Label("Upload Image", systemImage: "photo.badge.plus.fill")
                    Spacer()
                    
                    if let imageData = expense.image, let uiImage = UIImage(data: imageData){
                        
                        //Image View
                        
                        HStack(spacing:-16){
                            
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width:60,height:40)
                                .background(.ultraThinMaterial)
                                //.border(.gray,width:0.2)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                //.zIndex(1)
                                

                        }
                        .zIndex(2)
                        
                    }
    

                }
                .font(.headline.monospaced())
                .fontWeight(.semibold)
                .padding()
                //.border(Color.theme.accent)
                .accentColor(Color.theme.accent)
                .clipShape(.buttonBorder)
                .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                
                
                
                TextField("Amount", value: $expense.amountSpent , format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
                    .padding()
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    //.border(Color.theme.accent)
                    .accentColor(Color.theme.accent)
                    .clipShape(.buttonBorder)
                    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
                
                
               
                VStack{
                    Text("So, You Added \(expense.amountSpent) for \(expense.itemName) \(expense.person). ")
                    
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
                            expense.itemName = ""
                            expense.person = "for Myself"
                            expense.createdTimestamp = .now
                            expense.amountSpent = 0
                            selectedPhoto = nil
                            expense.image = nil
                        }
                        notificationFeedbackGenerator.notificationOccurred(.warning)
                        
                    }
                    .frame(maxWidth:.infinity)
                    .font(.headline.monospaced())
                    .fontWeight(.semibold)
                    .padding()
                    .accentColor(Color.theme.accent)
                    //.border(Color.theme.button)
                    
                    Button("Create Expense") {
                        //Dismissing the Sheet.
                        print("Create Expense Button Tapped.")
                        withAnimation {
                            context.insert(expense)
                        }
                        selectionFeedbackGenerator.selectionChanged()
                        dismiss()
                        createExpenseTip.invalidate(reason: .actionPerformed)
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
        .background(Color(.systemBackground))
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                expense.image = data
            }
        }
        
        
        Spacer()
    }

}

#Preview {
    CreateExpenseView(createExpenseTip: CreateExpenseTip(), swipeActionTip: SwipeActionTip() )
        .modelContainer(for:Expense.self)
}
