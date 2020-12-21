//
//  AchievementsResponseDTO.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation

struct AchievementsResponseDTO: Decodable {
    var records: [AchievementsDTO]
    var races: [AchievementsDTO]
}
