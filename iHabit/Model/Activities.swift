//
//  Activities.swift
//  iHabit
//
//  Created by Victor Colen on 14/12/21.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities = [Activity]() {
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities){
                activities = decodedActivities
                return
            }
        }
        activities = []
    }
}
