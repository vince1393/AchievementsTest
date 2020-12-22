//
//  APIClient.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-22.
//

import Foundation

struct ApiClient: ApiProtocol {
    static var shared: ApiProtocol = ApiClient()
    
    func getAchievements(completion: (AchievementsResponseDTO?, Error?) -> Void) {
        // Do API Call
    }
}
