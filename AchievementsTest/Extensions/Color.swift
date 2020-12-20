//
//  Color.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-20.
//

import SwiftUI

extension Color {
    init(named: String) {
        self.init(UIColor(named: named)!)
    }
    // Additional colour types
    
    // Background
    static var secondaryHeaderBackground = Color(named: "SecondaryHeaderBackground")

}
