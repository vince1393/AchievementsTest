//
//  MockAchievementProvider.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation
import SwiftUI

class AchievementProvider: ObservableObject {
    
    @Published var achievements: [Achievement] = []
    @Published var races: [Achievement] = []
    private var apiClient: ApiProtocol

    
    /// Initializer for Achievement Provider
    /// - Parameter apiClientOption: options for data source
    init(source apiClientOption: ApiClientOption) {
        apiClient = apiClientOption.client
        reload()
    }
    
    
    /// Options used for getting API client based on different sources of data
    enum ApiClientOption {
        case mock
        case live
        
        var client: ApiProtocol {
            switch self {
            case .mock: return MockApiClient.shared
            case .live: return ApiClient.shared
            }
        }
    }
    
    func reload() {
        apiClient.getAchievements { response, error in
            if let error = error {
                print("Error getting achievements - \(#file) - \(#line) - \(error)")
                return
            }
            
            guard let response = response else {
                print("Response is empty - \(#file) - \(#line)")
                return
            }
            
            DispatchQueue.main.async {
                self.achievements = response.records.asAchievements
                self.races = response.races.asAchievements
            }
        }
    }
}
