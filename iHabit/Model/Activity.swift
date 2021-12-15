//
//  Activity.swift
//  iHabit
//
//  Created by Victor Colen on 14/12/21.
//

import Foundation

class Activity: Codable, Identifiable, Equatable {
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        true
    }
    
    var id = UUID()
    let title: String
    let description: String
    var timesCompleted: Int
    
    init(id: UUID = UUID(), title: String, description: String, timesCompleted: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.timesCompleted = timesCompleted
    }
}
