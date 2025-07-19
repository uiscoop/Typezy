//
//  LazyGridView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 28/11/24.
//

import SwiftUI

struct RandomColor: View {
    
    @State var randomColor : Color = Color.yellow
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(randomColor)
            .frame(height:.infinity)
            .edgesIgnoringSafeArea(.all)
        
        Button {
            print("Magic is happening.. Watch it in the UI.")
        } label: {
            Image(systemName: "sparkle")
                .resizable()
                .frame(width: 24,height: 24)
                .padding()
                .background(randomColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture{
                    print("pressedddd")
                    self.newColor()
                }
        }
        
    }
    
    func newColor() {
        let randomOne  = Double.random(in: 0...255)
        let randomTwo  = Double.random(in: 0...255)
        let randomThree  = Double.random(in: 0...255)
        
        let randomColor = Color(red: randomOne/255, green: randomTwo/255, blue: randomThree/255)
        
        self.randomColor = randomColor
    }
}


#Preview {
    RandomColor()
}

//VStack{
//    
//    
//    Button {
//        print("pressed")
//    } label: {
//        //
//    }
//    .padding()
//    .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height/2)
//    .background(randomColor)
//   
//    Button {
//        print("pressed")
//    } label: {
//        Image(systemName: "sparkle")
//        Text("Randomise Color")
//    }
//    .padding()
//    .frame(maxWidth: .infinity, minHeight: 32)
//    .background(.black)
//    .foregroundStyle(randomColor)
//    
//
//    
//    Button {
//        print("Calendar Button Pressed.")
//    } label: {
//        Image(systemName: "rectangle.fill")
//            .resizable()
//            .frame(width:64,height: 64)
//            .foregroundStyle(randomColor)
//            //.tint(.yellow)
//    }
//
//}
////.padding()
//.edgesIgnoringSafeArea(.all)
////Spacer()
