//
//  AddActivityView.swift
//  iHabit
//
//  Created by Victor Colen on 14/12/21.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var activities: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Add a title", text: $title)
                TextField("Add a description", text: $description)
            }
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description, timesCompleted: 0)
                    activities.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
