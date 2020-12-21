//
//  AchievementProviderProtocol.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation
import SwiftUI

protocol AchievementProviderProtocol: ObservableObject {
    
    // https://medium.com/swlh/how-to-define-a-protocol-with-published-property-wrapper-type-1b6349097064
    
    var personalAchievements: Published<[Achievement]>.Publisher { get }
    var virtualRaces: Published<[Achievement]>.Publisher { get }
    func reload()
}
