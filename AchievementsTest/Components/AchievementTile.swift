//
//  AchievementTile.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-20.
//

import SwiftUI

struct AchievementTile: View {
    var achievement: Achievement
    
    var opacity: Double {
        achievement.isComplete ? 1 : 0.5
    }
    
    var body: some View {
        VStack(alignment:.center) {
            AsyncImage(url: URL(string: achievement.iconURL))
                .aspectRatio(contentMode: .fit)
                .padding()
                .background(Color.secondaryBackground)
            Text(achievement.name)
                .multilineTextAlignment(.center)
            Text(achievement.details)
                .multilineTextAlignment(.center)
        }
        .opacity(opacity)
    }
}

struct AchievementTile_Previews: PreviewProvider {
    static var achievementMock =                             Achievement(
            name: "Vince's Achievement",
            details: "00:00:00",
            iconURL: "https://www.google.ca",
            isComplete: true
        )
    
    static var previews: some View {
        AchievementTile(achievement: achievementMock)
            .preferredColorScheme(.light)
        
        AchievementTile(achievement: achievementMock)
            .preferredColorScheme(.dark)
    }
}
