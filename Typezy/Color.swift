//
//  Color.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import Foundation
import SwiftUI


extension Color{
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

// Call like this Color.theme.accent (or) Color.launch.accent

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("Background")
    let primaryText = Color("primaryTextColor")
    let secondaryText = Color("secondaryTextColor")
    let tertiaryText = Color("tertiaryTextColor")
    let surfaceOne = Color("SurfaceOne")
    let surfaceTwo = Color("SurfaceTwo")
    let surfaceThree = Color("SurfaceThree")
    let surfaceFour = Color("SurfaceFour")
    
    let button =  Color("ButtonBG")
    let icon = Color("IconFillColor")
    
    let buttonborder = Color("ButtonBorder")
}

struct LaunchTheme {
    let accent = Color("AccentColor")
    let background = Color("LaunchScreenBG")
    
}
