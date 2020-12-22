//
//  AchievementsDTO.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation

struct AchievementsDTO: Decodable {
    var name: String
    var description: String?
    var url: String?
    var completed: Bool
    
    /// Not really necessary since I created the JSON myself
    /// Moreso just showing understanding of decoding
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case url = "icon_url"
        case completed
    }
}
