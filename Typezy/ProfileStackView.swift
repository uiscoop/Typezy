//
//  ProfileStackView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 28/11/24.
//

import SwiftUI

struct ProfileStackView: View {
    
    //@State var randomColor : Color : .black
    
    var body: some View {
        VStack{
            //Circle Clipped
            HStack{
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.red.opacity(0.4))
                    .clipShape(Circle())
                    .shadow(radius: 2)
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.green.opacity(0.4))
                    .clipShape(Circle())
                    .shadow(radius: 2)
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.blue.opacity(0.4))
                    .clipShape(Circle())
                    .shadow(radius: 2)
            }
            //Rectangle Clipped
            HStack{
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.red.opacity(0.4))
                    .clipShape(Rectangle())
                    .shadow(radius: 2)
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.green.opacity(0.4))
                    .clipShape(Rectangle())
                    .shadow(radius: 2)
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.blue.opacity(0.4))
                    .clipShape(Rectangle())
                    .shadow(radius: 2)
            }
            //Rounded Rectangle Clipped
            HStack{
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.red.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 2)
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.green.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 2)
                Image(systemName: "sparkle")
                    .resizable()
                    .frame(width: 40,height:40)
                    .background(.blue.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 2)
            }
            
        }
        Spacer()
    
    }
    
    
}



#Preview {
    ProfileStackView()
}
