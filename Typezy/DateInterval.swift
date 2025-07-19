//
//  DateInterval.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 01/12/24.
//

import SwiftUI
import Foundation


let dateComponents: DateComponents = DateComponents(calendar: calendar, year: 1998, month: 1 , day: 22)
let composedDate = calendar.date(from: dateComponents)! // 22-01-1998

let calendar = Calendar.current

let yearsfromto = calendar.dateComponents([.year], from: composedDate, to: .now)
let monthsfromto = calendar.dateComponents([.month], from: composedDate, to: .now)
let daysfromto = calendar.dateComponents([.day], from: composedDate, to: .now)
let hoursfromto = calendar.dateComponents([.hour], from: composedDate, to: .now)
let minutesfromto = calendar.dateComponents([.minute], from: composedDate, to: .now)
let secondsfromto = calendar.dateComponents([.second], from: composedDate, to: .now)
let nanosecondsfromto = calendar.dateComponents([.nanosecond], from: composedDate, to: .now)


let addingDays = calendar.date(byAdding: .day, value: 90, to: .now)

let addingHours = calendar.date(byAdding: .hour, value: 48, to: .now)
let addingMonths = calendar.date(byAdding: .month, value: 15, to: .now)

let addingMinutes = calendar.date(byAdding: .minute, value: 300, to: .now)





struct DateInterval: View {
    

    var body: some View {
        
        
        VStack{
            
            Text("\(composedDate)")
            
            VStack(alignment: .leading){
                Text("+ Days : \(addingDays!.formatted(date: .long,time: .omitted))")
                Text("+ Hours : \(addingHours!.formatted(date: .long,time: .omitted))")
                Text("+ Months : \(addingMonths!.formatted(date: .long,time: .omitted))")
                Text("+ Minutes : \(addingMinutes!.formatted(date: .abbreviated,time: .shortened))")
            }
            
            Divider()
            
            Text(composedDate.formatted(.dateTime.day()))
            Text(composedDate.formatted(.dateTime.dayOfYear()))
            Text(composedDate.formatted(.dateTime.era()))
            Text(composedDate.formatted(.dateTime.month()))
            Text(composedDate.formatted(.dateTime.week()))
            Text(composedDate.formatted(.dateTime.weekday()))
            Text(composedDate.formatted(.dateTime))
            
            Divider()
            
            Text(Date().formatted(date: .abbreviated, time: .complete))
            Text(Date().formatted(date: .omitted, time: .shortened))
            

            Text(Date().addingTimeInterval(600), style: .date)
            //Text(Date().addingTimeInterval(100), style: .offset)
            //Text(Date().addingTimeInterval(600), style: .relative)
            Text(Date().addingTimeInterval(600), style: .time)
            //Text(Date().addingTimeInterval(600), style: .timer)
            
            HStack(spacing: 8){
                VStack{
                    Text(Date().formatted(.dateTime.month())).font(.system(size: 32, weight: .heavy)).monospacedDigit()
                    Text("MONTH").font(.footnote)
                }
                .padding()
                .background(.thinMaterial)
                VStack{
                    Text(Date().formatted(.dateTime.day())).font(.system(size: 32, weight: .heavy)).monospacedDigit()
                    Text("DAY").font(.footnote)
                }
                .padding()
                .background(.ultraThinMaterial)
                VStack{
                    Text(Date().formatted(.dateTime.year())).font(.system(size: 32, weight: .heavy)).monospacedDigit()
                    Text("YEAR").font(.footnote)
                }
                .padding()
                .background(.thinMaterial)
            }
            //.padding(.vertical)
            .background(.yellow.opacity(0.6))
            .cornerRadius(8)
            
            VStack{
            
                VStack{
                    Text("Year : \(yearsfromto.year ?? 0) years.")
                    Text("Month : \(monthsfromto.month ?? 0) months.")
                    Text("Days : \(daysfromto.day ?? 0) days.")
                }
                VStack{
                    Text("Hours : \(hoursfromto.hour ?? 0) hours.")
                    Text("Minutes : \(minutesfromto.minute ?? 0) minutes.")
                    Text("Seconds : \(secondsfromto.second ?? 0) seconds.")
                    Text("Nano Seconds : \(nanosecondsfromto.nanosecond ?? 0) nanoseconds.")
                }
                
                
                
                
                Button {
                    print("Reload Button Pressed.")
                    
                } label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                    Text("Reloading")
                }
                .padding()
                .background(.yellow.opacity(0.6))
                .cornerRadius(8)
            }
            .padding()
            .background(.yellow.opacity(0.6))
            .cornerRadius(8)
            
                
            Spacer()
            
            
  
        }
        .font(.headline).monospaced()
        
        
    }
}

#Preview {
    DateInterval()
}
