//
//  HapticView.swift
//  Typezy
//
//  Created by TEJROOP BONAGIRI on 26/11/24.
//

import SwiftUI

struct HapticView: View {
    
    let impactFeedbackGeneratorLight = UIImpactFeedbackGenerator(style: .light)
    let impactFeedbackGeneratorMedium = UIImpactFeedbackGenerator(style: .medium)
    let impactFeedbackGeneratorHeavy = UIImpactFeedbackGenerator(style: .heavy)
    let impactFeedbackGeneratorSoft = UIImpactFeedbackGenerator(style: .soft)
    let impactFeedbackGeneratorRigid = UIImpactFeedbackGenerator(style: .rigid)
    
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    
    
    var body: some View {

        VStack(alignment: .leading, spacing:24){
            Button {
                print("Impact Button is pressed - Light")
                impactFeedbackGeneratorLight.impactOccurred()
            } label: {
                Image(systemName: "plus")
                Text("Impact Feedback - Light")
            }
            
            Button {
                print("Impact Button is pressed - Medium")
                impactFeedbackGeneratorMedium.impactOccurred()
            } label: {
                Image(systemName: "plus")
                Text("Impact Feedback - Medium")
            }
            
            Button {
                print("Impact Button is pressed - Heavy")
                impactFeedbackGeneratorHeavy.impactOccurred()
            } label: {
                Image(systemName: "plus")
                Text("Impact Feedback - Heavy")
            }
            
            Button {
                print("Impact Button is pressed - Soft")
                impactFeedbackGeneratorSoft.impactOccurred()
            } label: {
                Image(systemName: "plus")
                Text("Impact Feedback - Soft")
            }
            
            Button {
                print("Impact Button is pressed - Rigid")
                impactFeedbackGeneratorRigid.impactOccurred()
            } label: {
                Image(systemName: "plus")
                Text("Impact Feedback - Rigid")
            }
            
            Button {
                print("Selection Button is pressed.")
                selectionFeedbackGenerator.selectionChanged()
            } label: {
                Image(systemName: "square")
                Text("Selection Feedback")
            }
            
            Button {
                print("Notification Button is pressed.")
                notificationFeedbackGenerator.notificationOccurred(.success)
            } label: {
                Image(systemName: "bell")
                Text("Notification Feedback")
            }
            
            Button {
                print("Notification Button is pressed. Error")
                notificationFeedbackGenerator.notificationOccurred(.error)
            } label: {
                Image(systemName: "bell")
                Text("Notification Feedback")
            }
            Button {
                print("Notification Button is pressed. Warning")
                notificationFeedbackGenerator.notificationOccurred(.warning)
            } label: {
                Image(systemName: "bell")
                Text("Notification Feedback")
            }
        }
    }
}

#Preview {
    HapticView()
}

