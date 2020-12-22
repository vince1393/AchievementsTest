//
//  MockAPIClient.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-22.
//

import Foundation

struct MockApiClient: ApiProtocol {
    static var shared: ApiProtocol = MockApiClient()
    
    
    /// Gets achievement data from mock source
    /// - Parameter completion: compeltion handler to be called when finished
    func getAchievements(completion: (AchievementsResponseDTO?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "achievements", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            do {
                let response = try JSONDecoder().decode(AchievementsResponseDTO.self, from: data)
                completion(response, nil)
            }
            catch (let error) {
                print("Decode error - \(#file) - \(#line) - \(error)")
                completion(nil, error)
            }
        }
    }
}
