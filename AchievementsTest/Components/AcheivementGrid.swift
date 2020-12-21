//
//  AcheivementGrid.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-20.
//

import SwiftUI

struct AcheivementGrid: View {
    @Binding var achievements: [Achievement]
    var title: String
    var showCompleted: Bool = true
    
    private var completed: String {
        let completed = achievements.filter { $0.isComplete }.count
        let total = achievements.count
        return "\(completed) of \(total)"
    }
    
    let rows = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                Spacer()
                
                if showCompleted {
                    Text(completed)
                }
            }
            .padding()
            .background(Color.secondaryHeaderBackground)
            LazyVGrid(columns: rows, spacing: 10) {
                ForEach(achievements.indices, id: \.self) { index in
                    AchievementTile(achievement: achievements[index])
                }
            }
        }
    }
}

struct AcheivementGrid_Previews: PreviewProvider {
    static var achievementMock = [
        Achievement(name: "Vince's Achievement", details: "00:00:00", iconURL: "https://www.google.ca", isComplete: true),
        Achievement(name: "Vince's Other Achievement", details: "00:00:00", iconURL: "https://www.google.ca", isComplete: true)
    ]
    
    static var previews: some View {
        AcheivementGrid(achievements: .constant(achievementMock), title: "Personal Records")
            .preferredColorScheme(.light)
        
        AcheivementGrid(achievements: .constant(achievementMock), title: "Personal Records")
            .preferredColorScheme(.dark)
    }
}
