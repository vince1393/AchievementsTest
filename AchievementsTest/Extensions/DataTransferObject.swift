//
//  DataTransferObject.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation

extension Array where Element == AchievementsDTO {
    var asAchievements: [Achievement] {
        self.map { Achievement(achievementDTO: $0) }
    }
}
