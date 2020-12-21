//
//  MockAchievementProvider.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation
import SwiftUI

class MockAchievementProvider: /*AchievementProviderProtocol */ ObservableObject {
    
    @Published var achievements: [Achievement] = []
    @Published var races: [Achievement] = []
//    
//    var personalAchievements: Published<[Achievement]>.Publisher { $achievements }
//    var virtualRaces: Published<[Achievement]>.Publisher { $races }
    
    init() {
        reload()
    }
    
    func reload() {
        if let url = Bundle.main.url(forResource: "achievements", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            do {
                let response = try JSONDecoder().decode(AchievementsResponseDTO.self, from: data)
                achievements = response.records.asAchievements
                races = response.races.asAchievements
            }
            catch (let error) {
                print("Decode error - \(#file) - \(#line) - \(error)")
            }
        }
    }
}
