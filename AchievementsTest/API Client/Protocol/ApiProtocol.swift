//
//  ApiProtocol.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation
import SwiftUI

protocol ApiProtocol {
    static var shared: ApiProtocol { get }
    func getAchievements(completion: (AchievementsResponseDTO?, Error?) -> Void)
}
