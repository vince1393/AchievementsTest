//
//  AcheivementGrid.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-20.
//

import SwiftUI

struct AcheivementGrid: View {
    @State var achievements: [Achievement]
    var title: String
    
    private var completed: String {
        let completed = achievements.filter { $0.isComplete }.count
        let total = achievements.count
        return "\(completed) of \(total)"
    }
    
    let rows = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                Spacer()
                Text(completed)
            }
            .padding()
            .background(Color.secondaryHeaderBackground)
            LazyVGrid(columns: rows, spacing: 10) {
                ForEach(achievements.indices, id: \.self) { index in
                    Text(achievements[index].name)
                }
            }
        }
    }
}

struct AcheivementGrid_Previews: PreviewProvider {
    static var previews: some View {
        AcheivementGrid(achievements: [], title: "Personal Records")
            .preferredColorScheme(.light)
        
        AcheivementGrid(achievements: [], title: "Personal Records")
            .preferredColorScheme(.dark)
    }
}
