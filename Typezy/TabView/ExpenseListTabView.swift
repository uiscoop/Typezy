//
//  ExpenseListTabView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import SwiftUI
import SwiftData
import TipKit

struct ExpenseListTabView : View {
    
    @State private var searchQuery: String = ""
    @Query(sort: \Expense.createdTimestamp, order: .reverse) private var expenseList : [Expense]
    
    let swipeActionTip = SwipeActionTip()
    
    @State private var showExpenseDetailSheet : Bool = false
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    @Environment(\.modelContext) var context
    
    
    var filteredExpenses: [Expense]{
        if searchQuery.isEmpty{
            return expenseList
        }
        let filteredItems = expenseList.compactMap { item in
            let titleContainsQuery = item.itemName.range(of: searchQuery,
                options:.caseInsensitive) != nil
            
            return titleContainsQuery ? item : nil
        }
        return filteredItems
    }
    
    var body: some View {
        
        if(filteredExpenses.count == 0 ){
            EmptyExpenseListView()
        }else{
            List{
                Text("Total Items: \(filteredExpenses.count)")
                    .font(.title3).monospaced().fontWeight(.medium)
                    .background(.clear)
                
                // Inline Popover Expense Tip - swipeActionTip
                TipView(swipeActionTip)
                ForEach(filteredExpenses , id: \.self){ expense in
                    
                    VStack{
                        VStack(spacing:4){
                            HStack{
                                VStack(alignment:.leading){
                                    Text("spent").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
                                    Text("\(expense.amountSpent)").font(.title3.monospaced()).fontWeight(.medium)
                                        .foregroundStyle(.primaryText)
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                Spacer()
                                // BUTTON
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
                            HStack{
                                VStack(alignment: .leading){
                                    Text("for").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
                                    Text("\(expense.itemName)").font(.title3.monospaced()).fontWeight(.medium)
                                        .foregroundStyle(.primaryText)
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                Spacer()
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("on").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
                                    Text("\(expense.createdTimestamp.formatted())").font(.title3.monospaced()).fontWeight(.medium).foregroundStyle(.primaryText)
                                    
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                Spacer()
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(expense.person)")
                                        .font(.title3.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.primaryText)
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                
                                Spacer()
                            }
                            
                            
                            
                            // Days Container
                            VStack{
                                //11
                                HStack(spacing: 4){
                                    Spacer()
                                    
                                    //YEARS
                                    VStack{
                                        Text("\(Calendar.current.dateComponents([.year], from: expense.createdTimestamp, to: .now).year ?? 0) YEARS")
                                            .kerning(1)
                                            .fontDesign(.monospaced)
                                            .font(.footnote).fontWeight(.heavy)
                                            //.background(.red)
                                    }
                                    .padding(9)
                                    .background(.gray.gradient.opacity(0.2))
                                    .clipShape(.buttonBorder)
                //                    .background(.gray.gradient.quinary.opacity(0.8)).clipShape(.buttonBorder)
                                    
                                    VStack{
                                        Text("\(Calendar.current.dateComponents([.month], from: expense.createdTimestamp, to: .now).month ?? 0) MONTHS")
                                            .kerning(1)
                                            .fontDesign(.monospaced)
                                            .font(.footnote).fontWeight(.heavy)
                                            //.background(.green)
                                    }
                                    .padding(9)
                                    .background(.gray.gradient.opacity(0.2))
                                    .clipShape(.buttonBorder)
                                    
                //                    .background(.gray.gradient.quinary.opacity(0.8)).clipShape(.buttonBorder)
                                    
                                    VStack{
                                        Text("\(Calendar.current.dateComponents([.day], from: expense.createdTimestamp, to: .now).day ?? 0) DAYS")
                                            .kerning(1)
                                            .fontDesign(.monospaced)
                                            .font(.footnote).fontWeight(.heavy)
                                            
                                    }
                                    .padding(9)
                                    .background(.gray.gradient.opacity(0.2))
                                    .clipShape(.buttonBorder)
                //                    .background(.gray.gradient.quinary.opacity(0.8)).clipShape(.buttonBorder)
                                    

                                    Spacer()
                                    
                                    
                                }.padding(9).background(.gray.gradient.quinary.opacity(0.8)).clipShape(.buttonBorder)
                                
                                
                                Spacer()
                            }.fontDesign(.monospaced)
                            
                            
                            
                            
                        }
                        .background(.clear)
                        //.padding()
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32)
                    //.border(.primaryText, width:0.2)
                    //.background(.clear)
                }
                
                .onDelete(perform: deleteExpense)
            }
        }
        
        
    }
    
    
    private func deleteExpense(offsets : IndexSet){
        withAnimation {
            for index in offsets{
                context.delete(expenseList[index])
            }
        }
    }
}

#Preview {
    ExpenseListTabView()
}

// knowmore button with sheet


//VStack{
//    Button("Know More") {
//        //Dismissing the Sheet.
//        print("Know More Button Tapped")
//        showExpenseDetailSheet = true
//        selectionFeedbackGenerator.selectionChanged()
//    }
//    .padding()
//    .frame(maxWidth:.infinity)
//    .font(.headline.monospaced())
//    .fontWeight(.semibold)
//    .accentColor(Color.theme.primaryText)
//    //.background(Color.theme.button)
//    .background(.thinMaterial)
//    .clipShape(.buttonBorder)
//    .overlay(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(Color.theme.accent))
//    .allowsHitTesting(false)
//    
//    
//}
//
//.sheet(isPresented: $showExpenseDetailSheet, content: {
//    //MARK: This is Expense Detail Sheet View.
//    //ExpenseDetailSheetView()
//    VStack{
//        ScrollView{
//            // Container
//            LazyVStack{
//                Text("Purchased Item Age is almost:").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.primaryText)
//                    .padding()
//                
//                //Date Container
//                HStack(spacing: 8){
//                    VStack{
//                        //                                                            Text(Date().formatted(.dateTime.day())).font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text(expense.createdTimestamp.formatted(.dateTime.day())).font(.title3.monospaced()).fontWeight(.black)
//                            .foregroundStyle(.primaryText)
//                        
//                        Text("--").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .padding()
//                    .background(.thinMaterial)
//                    
//                    VStack{
//                        //                                                            Text(Date().formatted(.dateTime.month(.wide))).font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text(expense.createdTimestamp.formatted(.dateTime.month(.wide))).font(.title3.monospaced()).fontWeight(.black)
//                            .foregroundStyle(.primaryText)
//                        Text("DATE").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .padding()
//                    .background(.thinMaterial)
//                    
//                    VStack{
//                        //                                                            Text(Date().formatted(.dateTime.year())).font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text(expense.createdTimestamp.formatted(.dateTime.year())).font(.title3.monospaced()).fontWeight(.black)
//                            .foregroundStyle(.primaryText)
//                        Text("----").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .padding()
//                    .background(.thinMaterial)
//                }
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(.surfaceOne)
//                .cornerRadius(8)
//                
//                //Divider
//                Divider().padding()
//               
//                
//                // DATE - TIME Information Coontainer
//                VStack{
//                    //Seconds
//                    VStack{
//                        //                                                            Text("\(secondsfromto.second ?? 0)").font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text("\(Calendar.current.dateComponents([.second], from: expense.createdTimestamp, to: .now).second ?? 0)")
//                        Text("- SECONDS -").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    
//                    //Minutes
//                    VStack{
//                        //                                                            Text("\(minutesfromto.minute ?? 0)").font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text("\(Calendar.current.dateComponents([.minute], from: expense.createdTimestamp, to: .now).minute ?? 0)")
//                        Text("- MINUTES -").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    
//                    //Hours
//                    VStack{
//                        //                                                            Text("\(hoursfromto.hour ?? 0)").font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text("\(Calendar.current.dateComponents([.hour], from: expense.createdTimestamp, to: .now).hour ?? 0)")
//                        Text("- HOURS -").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    
//                    //Days
//                    VStack{
//                        //                                                            Text("\(daysfromto.day ?? 0)").font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text("\(Calendar.current.dateComponents([.day], from: expense.createdTimestamp, to: .now).day ?? 0)")
//                        Text("- DAYS -").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    
//                    //Months
//                    VStack{
//                        //                                                            Text("\(monthsfromto.month ?? 0)").font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text("\(Calendar.current.dateComponents([.month], from: expense.createdTimestamp, to: .now).month ?? 0)")
//                        Text("- MONTHS -").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    
//                    //Years
//                    VStack{
//                        //                                                            Text("\(yearsfromto.year ?? 0)").font(.title3.monospaced()).fontWeight(.black)
//                        //                                                                .foregroundStyle(.primaryText)
//                        Text("\(Calendar.current.dateComponents([.year], from: expense.createdTimestamp, to: .now).year ?? 0)")
//                        Text("- YEARS -").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                }
//                
//                //Divider
//                Divider().padding()
//
//                
//                //Button Container
//                VStack{
//                    //Button here
//                    Button {
//                        print("Dismiss Button Pressed.")
//                        //dismiss
//                        showExpenseDetailSheet.toggle()
//                        selectionFeedbackGenerator.selectionChanged()
//                    } label: {
//                        Text("- CLOSE -").font(.headline).monospaced().fontWeight(.medium)
//                    }
//                    .frame(maxWidth:.infinity)
//                    .padding()
//                    .font(.headline.monospaced())
//                    .fontWeight(.semibold)
//                    .background(.thinMaterial)
//                    .accentColor(Color.theme.primaryText)
//                    .border(Color.theme.accent)
//                    //.cornerRadius(8)
//                }
//                
//                
//            }
//            .padding()
//            .background(.surfaceOne)
//            
//            .cornerRadius(8)
//        }
//        .padding()
//        .edgesIgnoringSafeArea(.bottom)
//        .background(.surfaceOne)
//        
//        Spacer()
//    }
//        .presentationDetents([.fraction(0.6)])
//        .edgesIgnoringSafeArea(.bottom)
//        .presentationDragIndicator(.hidden)
//})
