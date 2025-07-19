//
//  EventListTabView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 02/01/25.
//

import SwiftUI
import SwiftData
import TipKit

struct EventListTabView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var searchQuery: String = ""
    @Query(sort: \Event.eventDate, order: .reverse) private var eventList : [Event]
    
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    var filteredEvents: [Event]{
        if searchQuery.isEmpty{
            return eventList
        }
        let filteredItems = eventList.compactMap { item in
            let titleContainsQuery = item.person.range(of: searchQuery,
                options:.caseInsensitive) != nil
            
            return titleContainsQuery ? item : nil
        }
        return filteredItems
    }
    
    var body: some View {
        //Make ==0 i just changed
        if (filteredEvents.count == 0){
            EmptyEventListView()
        }else{
            List{
                Text("Total Items: \(filteredEvents.count)")
                    .font(.title3).monospaced().fontWeight(.medium)
                    .background(.clear)
                
                ForEach(filteredEvents){event in
                    LazyVStack{
                        VStack(spacing:4){
                            HStack{
                                VStack(alignment:.leading){
                                    Text("person's").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
                                    Text("\(event.person)").font(.title3.monospaced()).fontWeight(.medium)
                                        .foregroundStyle(.primaryText)
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                Spacer()
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("event").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
                                    Text("\(event.eventName)").font(.title3.monospaced()).fontWeight(.medium)
                                        .foregroundStyle(.primaryText)
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                Spacer()
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("was on").font(.headline.monospaced().smallCaps()).fontWeight(.medium).foregroundStyle(.secondaryText)
                                    Text("\(event.eventDate.formatted())").font(.title3.monospaced()).fontWeight(.medium).foregroundStyle(.primaryText)
                                    
                                }
                                .padding(.horizontal)
                                //.background(.surfaceOne)
                                Spacer()
                            }
                            
                            
                            
                            //Days Container
                            VStack{
                                //11
                                HStack(spacing: 4){
                                    Spacer()
                                    
                                    //YEARS
                                    VStack{
                                        Text("\(Calendar.current.dateComponents([.year], from: event.eventDate, to: .now).year ?? 0) YEARS")
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
                                        Text("\(Calendar.current.dateComponents([.month], from: event.eventDate, to: .now).month ?? 0) MONTHS")
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
                                        Text("\(Calendar.current.dateComponents([.day], from: event.eventDate, to: .now).day ?? 0) DAYS")
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
                        //.padding()
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32)
                    //.border(.primaryText, width:0.2)
                    .background(.clear)
                }
                .onDelete(perform: deleteEvent)
                
            }
        }
        
    }
    
    private func deleteEvent(offsets : IndexSet){
        withAnimation {
            for index in offsets{
                context.delete(eventList[index])
            }
        }
    }
}

#Preview {
    EventListTabView()
}
