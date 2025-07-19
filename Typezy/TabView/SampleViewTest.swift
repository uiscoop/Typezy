//
//  SampleViewTest.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 04/01/25.
//

import SwiftUI
import Foundation

let calendar1 = Calendar.current

let yearsfromtoo = calendar1.dateComponents([.year], from: composedDate, to: .now)
let monthsfromtoo = calendar1.dateComponents([.month], from: composedDate, to: .now)
let daysfromtoo = calendar1.dateComponents([.day], from: composedDate, to: .now)
let hoursfromtoo = calendar.dateComponents([.hour], from: composedDate, to: .now)
let minutesfromtoo = calendar.dateComponents([.minute], from: composedDate, to: .now)
let secondsfromtoo = calendar.dateComponents([.second], from: composedDate, to: .now)

struct SampleViewTest: View {
    var body: some View {
        
        VStack(alignment: .center){
            HStack{
                VStack(alignment: .leading){
                    Text("SPENT").font(.footnote).fontWeight(.heavy)
                    Text("100000").monospaced()
                }.padding().background(.white.opacity(0.1)).clipShape(.buttonBorder)
                Spacer()
                HStack{
                    VStack{
                                Text("24").fontWeight(.heavy).font(.largeTitle)
                                Text("DAYS")
                                    .font(.headline).fontWeight(.bold).foregroundStyle(.primaryText)
                            }
                    .padding(6)
                    .background(.gray.gradient.quinary.opacity(0.5)).clipShape(.buttonBorder)
                    
                }
            }.padding(6).background(.gray.gradient.quinary.opacity(0.8))
            
            //Content
            HStack{
                //1
                VStack(alignment: .leading){
                    Text("FOR")
                        .kerning(1)
                        .fontDesign(.monospaced)
                        .font(.footnote).fontWeight(.heavy)
                    Text("MacBook Air 2022").fontDesign(.serif).fontWeight(.bold)
                }.padding(9).background(.gray.gradient.quinary.opacity(0.8)).clipShape(.buttonBorder)
        
                Spacer()
            }
            HStack{
                //1
                VStack(alignment: .leading){
                    Text("ON")
                        .kerning(1)
                        .fontDesign(.monospaced)
                        .font(.footnote).fontWeight(.heavy)
                    Text("4/1/2024, 9:05 AM").fontDesign(.serif).fontWeight(.bold)
                }.padding(9).background(.gray.gradient.quinary.opacity(0.8)).clipShape(.buttonBorder)
                
                Spacer()
            }
            
            //Information
            VStack{
                //11
                HStack(spacing: 4){
                    Spacer()
                    
                    //YEARS
                    VStack{
                        Text("\(yearsfromtoo.year ?? 0) YEARS")
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
                        Text("\(monthsfromtoo.month ?? 0) MONTH")
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
                        Text("\(daysfromtoo.day ?? 0) DAYS")
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
            }
            .fontDesign(.monospaced)
            
            
            
            
        }
        //.clipShape(.buttonBorder)
        .padding()
        Spacer()
        
    }
}

#Preview {
    SampleViewTest()
}


//VStack{
//    VStack{
//        Text("SPENT")
//            .font(.headline).fontWeight(.bold).foregroundStyle(.primaryText)
//        Text("100000").fontWeight(.heavy).font(.largeTitle).foregroundStyle(.accent)
//    }
//    .padding().background(.gray.gradient.quinary.opacity(0.5))
//        .clipShape(.buttonBorder)
//}
//
//
//HStack{
//    Spacer()
//    HStack(alignment: .center){
//        Spacer()
//        VStack{
//            Text("24").fontWeight(.heavy).font(.largeTitle)
//            Text("DAYS")
//                .font(.headline).fontWeight(.bold).foregroundStyle(.primaryText)
//        }.padding().background(.gray.gradient.quinary.opacity(0.5))
//            .clipShape(.buttonBorder)
//        Spacer()
//
//    }
//    .padding(4)
//    //.background(.thinMaterial)
//    .clipShape(.buttonBorder)
//    Spacer()
//}
//.padding(.horizontal)
////.background(.quaternary.opacity(0.5))
