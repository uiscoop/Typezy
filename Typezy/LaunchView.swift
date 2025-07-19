//
//  LaunchView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Recall with Typezy".map{ String($0) }
    @State private var showLoadingText: Bool = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView : Bool
    
    var body: some View {
        ZStack{
            Color.launch.background
                .ignoresSafeArea()
            Image("logo")
                .resizable()
                .frame(width: 100 ,height: 100)
            
            ZStack{
                if showLoadingText {
                    // Success Case
//                    Text(loadingText)
//                        .font(.headline)
//                        .fontWeight(.heavy)
//                        .foregroundStyle(Color.launch.accent)
//                        .transition(AnyTransition.scale.animation(.easeIn))
                    
                    HStack(spacing: 0){
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.launch.accent)
                                .offset(y: counter == index ? -10 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y:70)
        }
        .onAppear{
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()){
                let lastIndex = loadingText.count-1
                if counter == lastIndex{
                    counter = 0
                    loops+=1
                    if loops>1{
                        showLaunchView = false
                    }
                }else{
                    counter+=1
                }
                
            }
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
