//
//  AchievementProvider.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation

class AchievementProvider: AchievementProviderProtocol {
    @Published private var achievements: [Achievement] = []
    @Published private var races: [Achievement] = []
    
    var personalAchievements: Published<[Achievement]>.Publisher { $achievements }
    var virtualRaces: Published<[Achievement]>.Publisher { $races }
    
    init() {
        reload()
    }
    
    func reload() {
        // API Call to get data
    }
}
