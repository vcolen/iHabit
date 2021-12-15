//
//  ActivityView.swift
//  iHabit
//
//  Created by Victor Colen on 14/12/21.
//

import SwiftUI

struct ActivityView: View {
    var activity: Activity
    @StateObject var activities = Activities()
    @State private var aux = 0
    
    var body: some View {
        VStack {
            Text(activity.title)
                .font(.title)
            Text(activity.description)
            Stepper("Completed \(aux) times", value: $aux, in: 0...365)
                .onAppear {
                    aux = activity.timesCompleted
                }
                .onDisappear {
                    if let i = activities.activities.firstIndex(of: activity) {
                        activity.timesCompleted = aux
                        activities.activities[i] = activity
                    }
                }
        }
    }
}

//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityView(activity: Activity())
//    }
//}
