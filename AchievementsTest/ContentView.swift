//
//  ContentView.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AcheivementGrid(achievements: [], title: "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
