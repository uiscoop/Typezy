//
//  EmptyExpenseListView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import SwiftUI

struct EmptyExpenseListView: View {
    var body: some View {
        VStack{
            Spacer()
            ContentUnavailableView {
                Image(systemName: "indianrupeesign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48 , height: 48)
                    .symbolRenderingMode(.hierarchical)
                    .symbolEffect(.pulse)
                
                Text("No Expenses to Display")
                    .bold()
                    .font(.headline)
                    .monospaced()
                    .padding(.top,20)
            } description: {
                
                Text("Create an Expense to see it here.")
                    .bold()
                    .padding(.all,10)
                    .monospaced().font(.headline)
            }
//           actions: {
////                Button {
////                    print("- Feed Empty View -")
////
////                } label: {
////                    Image(systemName: "sparkle")
////                        .symbolRenderingMode(.hierarchical)
////                        .symbolEffect(.rotate)
////                    Text("Create a New Post")
////                        .monospaced()
////                        .bold()
////                    Image(systemName: "sparkle")
////                        .symbolRenderingMode(.hierarchical)
////                        .symbolEffect(.rotate)
////                }
////                .padding()
////                .background(.black.gradient.opacity(0.75))
////                .clipShape(RoundedRectangle(cornerRadius: 16))
////                .foregroundStyle(.white)
////                //.buttonStyle(.bordered)
////                //.clipShape(.buttonBorder)
//                Image("arrowfacingdown")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 120, height: 120)
//                    //.border(.gray, width: 0.4)
//                    
//                    //.background(.gray.gradient.quinary)
//                    .clipShape(.buttonBorder)
//                    .foregroundStyle(.red)
//            }
            Spacer()

        }
        .background(.windowBackground)
    }
}

#Preview {
    EmptyExpenseListView()
}
