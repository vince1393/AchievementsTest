//
//  ContentView.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var achievementProvider = MockAchievementProvider()
    
    var body: some View {
        ScrollView {
            AcheivementGrid(
                achievements: $achievementProvider.achievements,
                title: "Personal Records"
            )
            AcheivementGrid(
                achievements: $achievementProvider.races,
                title: "Virtual Races",
                showCompleted: false
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
