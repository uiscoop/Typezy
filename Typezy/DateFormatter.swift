//
//  EventItem.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 27/11/24.
//

import SwiftUI

struct DateFormatter: View {
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height

    
    var body: some View {
        
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
           
        }
        .padding()
        .frame(maxWidth:.infinity)
        .frame(height:200)
        .background(.surfaceOne)
        
        ScrollView(){
            LazyVStack(alignment: .leading){
                Text("Date").font(.title.bold())
                Text("Date References").font(.title2.bold())
                Text("last updated \(Date().dateWithAbbreviatedOmitted)")
                Text("last updated \(Date().dateWithAbbreviatedComplete)")
                Text("last updated \(Date().dateWithAbbreviatedStandard)")
                Text("last updated \(Date().dateWithAbbreviatedShortened)")
                Text("Current Time is: \(Date.now)")
                
                Text("last updated \(Date().dateWithCompleteOmitted)")
                Text("last updated \(Date().dateWithCompleteComplete)")
                Text("last updated \(Date().dateWithCompleteStandard)")
                Text("last updated \(Date().dateWithCompleteShortened)")
                
                Text("last updated \(Date().dateWithOmittedOmitted)")
                Text("last updated \(Date().dateWithOmittedComplete)")
                Text("last updated \(Date().dateWithOmittedStandard)")
                Text("last updated \(Date().dateWithOmittedShortened)")
                
                
                Text("last updated \(Date().dateWithLongOmitted)")
                Text("last updated \(Date().dateWithLongComplete)")
                Text("last updated \(Date().dateWithLongStandard)")
                Text("last updated \(Date().dateWithLongShortened)")
                
                Text("last updated \(Date().dateWithNumericOmitted)")
                Text("last updated \(Date().dateWithNumericComplete)")
                Text("last updated \(Date().dateWithNumericStandard)")
                Text("last updated \(Date().dateWithNumericShortened)")
                
                
                Divider()
                Text("Calendar").font(.title.bold())
                let calendar = Calendar.current
//                
//                let dateComponents = DateComponents(calendar: calendar, year: 2020 ,month: 4, day: 22)
//                let composedDate = calendar.date(from: dateComponents)
//                
//                
//                let tenDaysFromNow = calendar.date(byAdding: .day, value: 10, to: .now)
//                
//                let timeInterval = calendar.dateComponents([.day], from: composedDate, to: .now)
//                let daysSince = timeInterval.day!
                
                
                
                Text("Calendar Description").font(.title2.bold())
                Text("1: \(calendar.identifier)")
                Text("2: \(calendar.timeZone)")
                Text("4: \(calendar.customMirror)")
                Text("5: \(calendar.debugDescription)")
                Text("6: \(calendar.description)")
                
                Text("AM-PM").font(.title2.bold())
                Text("3: \(calendar.amSymbol)")
                Text("13: \(calendar.pmSymbol)")
                
                Text("Era").font(.title2.bold())
                Text("7: \(calendar.eraSymbols)")
                Text("10: \(calendar.longEraSymbols)")
                
                Text("Minimum Days").font(.title2.bold())
                Text("8: \(calendar.firstWeekday)")
                Text("11: \(calendar.minimumDaysInFirstWeek)")
                
                Text("Hash Value").font(.title2.bold())
                Text("9: \(calendar.hashValue)")
                
                
                Text("Month").font(.title2.bold())
                Text("\(calendar.monthSymbols)")
                Text(" \(calendar.shortMonthSymbols)")
                
                Text("Quarter").font(.title2.bold())
                Text(" \(calendar.quarterSymbols)")
                Text(" \(calendar.shortQuarterSymbols)")
                
                Divider()
                Text("Date").font(.title.bold())
                Text("Day").font(.title2.bold())
                Text(Date().formatted(.dateTime.day()))
                Text(Date().formatted(.dateTime.day(.defaultDigits)))
                Text(Date().formatted(.dateTime.day(.omitted)))
                Text(Date().formatted(.dateTime.day(.ordinalOfDayInMonth)))
                Text(Date().formatted(.dateTime.day(.twoDigits)))
                Text(Date().formatted(.dateTime.day(.julianModified())))
                
                Divider()
                Text("Day of Year").font(.title2.bold())
                Text(Date().formatted(.dateTime.dayOfYear()))
                Text(Date().formatted(.dateTime.dayOfYear(.defaultDigits)))
                Text(Date().formatted(.dateTime.dayOfYear(.omitted)))
                Text(Date().formatted(.dateTime.dayOfYear(.threeDigits)))
                Text(Date().formatted(.dateTime.dayOfYear(.twoDigits)))
                
                
                Divider()
                Text("Era").font(.title2.bold())
                Text(Date().formatted(.dateTime.era()))
                Text(Date().formatted(.dateTime.era(.abbreviated)))
                Text(Date().formatted(.dateTime.era(.narrow)))
                Text(Date().formatted(.dateTime.era(.omitted)))
                Text(Date().formatted(.dateTime.era(.wide)))
                
                
                Divider()
                Text("Hour").font(.title2.bold())
                Text(Date().formatted(.dateTime.hour()))
            
                Text(Date().formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .abbreviated))))
                Text(Date().formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .narrow))))
                Text(Date().formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .omitted))))
                Text(Date().formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .wide))))


                Divider()
                Text("Locale").font(.title2.bold())
                //Text(Date().formatted(.dateTime.locale))
                
                
                
                
                Divider()
                Text("Minute").font(.title2.bold())
                Text(Date().formatted(.dateTime.minute()))
                Text(Date().formatted(.dateTime.minute(.defaultDigits)))
                Text(Date().formatted(.dateTime.minute(.omitted)))
                Text(Date().formatted(.dateTime.minute(.twoDigits)))
                
                
                
                Divider()
                Text("Month").font(.title2.bold())
                Text(Date().formatted(.dateTime.month()))
                Text(Date().formatted(.dateTime.month(.abbreviated)))
                Text(Date().formatted(.dateTime.month(.defaultDigits)))
                Text(Date().formatted(.dateTime.month(.narrow)))
                Text(Date().formatted(.dateTime.month(.omitted)))
                Text(Date().formatted(.dateTime.month(.twoDigits)))
                Text(Date().formatted(.dateTime.month(.wide)))
                
                Divider()
                Text("Quarter").font(.title2.bold())
                Text(Date().formatted(.dateTime.quarter()))
                Text(Date().formatted(.dateTime.quarter(.abbreviated)))
                Text(Date().formatted(.dateTime.quarter(.narrow)))
                Text(Date().formatted(.dateTime.quarter(.omitted)))
                Text(Date().formatted(.dateTime.quarter(.oneDigit)))
                Text(Date().formatted(.dateTime.quarter(.twoDigits)))
                Text(Date().formatted(.dateTime.quarter(.wide)))
                
                Divider()
                Text("Seconds").font(.title2.bold())
                Text(Date().formatted(.dateTime.second()))
                Text(Date().formatted(.dateTime.second(.defaultDigits)))
                Text(Date().formatted(.dateTime.second(.omitted)))
                Text(Date().formatted(.dateTime.second(.twoDigits)))
                
                Divider()
                Text("Time Zone").font(.title2.bold())
                Text(Date().formatted(.dateTime.timeZone()))
                Text(Date().formatted(.dateTime.timeZone(.exemplarLocation)))
                Text(Date().formatted(.dateTime.timeZone(.genericLocation)))
                Text(Date().formatted(.dateTime.timeZone(.omitted)))
                
                
                Divider()
                Text("Week").font(.title2.bold())
                Text(Date().formatted(.dateTime.week()))
                Text(Date().formatted(.dateTime.week(.defaultDigits)))
                Text(Date().formatted(.dateTime.week(.omitted)))
                Text(Date().formatted(.dateTime.week(.twoDigits)))
                Text(Date().formatted(.dateTime.week(.weekOfMonth)))
                
                Divider()
                Text("Week Day").font(.title2.bold())
                Text(Date().formatted(.dateTime.weekday()))
                Text(Date().formatted(.dateTime.weekday(.abbreviated)))
                Text(Date().formatted(.dateTime.weekday(.narrow)))
                Text(Date().formatted(.dateTime.weekday(.omitted)))
                Text(Date().formatted(.dateTime.weekday(.oneDigit)))
                Text(Date().formatted(.dateTime.weekday(.short)))
                Text(Date().formatted(.dateTime.weekday(.twoDigits)))
                Text(Date().formatted(.dateTime.weekday(.wide)))
                
                Divider()
                Text("Year").font(.title2.bold())
                Text(Date().formatted(.dateTime.year()))
                Text(Date().formatted(.dateTime.year(.defaultDigits)))
                Text(Date().formatted(.dateTime.year(.omitted)))
                Text(Date().formatted(.dateTime.year(.twoDigits)))
                Text(Date().formatted(.dateTime.year(.extended())))
                Text(Date().formatted(.dateTime.year(.relatedGregorian())))
                
                Divider()
                Text("Lengthy").font(.title2.bold())
                Text(Date().formatted(.dateTime.year().month().day().hour().minute().second()))
                
                
                
                
                
            }
            .padding()
            .frame(maxWidth: screenWidth - 16)
            //.frame(height: screenHeight)
            .edgesIgnoringSafeArea(.bottom)
            .background(.surfaceOne)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        
        
        Spacer()
    }
}

#Preview {
    DateFormatter()
}

extension Date {
    var dateWithOmittedShortened : String {
        self.formatted(date: .omitted, time: .shortened)
    }
    var dateWithOmittedComplete : String {
        self.formatted(date: .omitted, time: .complete)
    }
    var dateWithOmittedOmitted : String {
        self.formatted(date: .omitted, time: .omitted)
    }
    var dateWithOmittedStandard : String {
        self.formatted(date: .omitted, time: .standard)
    }
    
    var dateWithAbbreviatedShortened : String {
        self.formatted(date: .abbreviated, time: .shortened)
    }
    var dateWithAbbreviatedComplete : String {
        self.formatted(date: .abbreviated, time: .complete)
    }
    var dateWithAbbreviatedOmitted : String {
        self.formatted(date: .abbreviated, time: .omitted)
    }
    var dateWithAbbreviatedStandard : String {
        self.formatted(date: .abbreviated, time: .standard)
    }
    
    var dateWithCompleteShortened : String {
        self.formatted(date: .complete, time: .shortened)
    }
    var dateWithCompleteComplete : String {
        self.formatted(date: .complete, time: .complete)
    }
    var dateWithCompleteOmitted : String {
        self.formatted(date: .complete, time: .omitted)
    }
    var dateWithCompleteStandard : String {
        self.formatted(date: .complete, time: .standard)
    }
    
    var dateWithLongShortened : String {
        self.formatted(date: .long, time: .shortened)
    }
    var dateWithLongComplete : String {
        self.formatted(date: .long, time: .complete)
    }
    var dateWithLongOmitted : String {
        self.formatted(date: .long, time: .omitted)
    }
    var dateWithLongStandard : String {
        self.formatted(date: .long, time: .standard)
    }
    
    var dateWithNumericShortened : String {
        self.formatted(date: .numeric, time: .shortened)
    }
    var dateWithNumericComplete : String {
        self.formatted(date: .numeric, time: .complete)
    }
    var dateWithNumericOmitted : String {
        self.formatted(date: .numeric, time: .omitted)
    }
    var dateWithNumericStandard : String {
        self.formatted(date: .numeric, time: .standard)
    }
    
    var displayFormat : String{
        self.formatted(.dateTime)
    }
 
}


