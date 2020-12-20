//
//  Achievement.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-20.
//

import Foundation

struct Achievement {
    var name: String
    var details: String
    var iconURL: String
    var isComplete: Bool
    
    /// Initializer for Achievement struct
    /// - Parameters:
    ///   - name: name of the achievement
    ///   - details: can be either time, elevation, distance, etc.
    ///   - iconURL: url for icon to display
    ///   - isComplete: flag for completion of the challenge
    init(name: String, details: String?, iconURL: String, isComplete: Bool) {
        self.name = name
        self.details = details ?? "Not Yet"
        self.iconURL = iconURL
        self.isComplete = isComplete
    }
}
