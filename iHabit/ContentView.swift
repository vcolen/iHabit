//
//  ContentView.swift
//  iHabit
//
//  Created by Victor Colen on 14/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var isShowingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activities) { activity in
                    NavigationLink {
                        ActivityView(activity: activity)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(activity.title)
                                .font(.headline)
                            Text(activity.description)
                        }
                    }
                }
                .onDelete(perform: deleteActivity)
            }
            .navigationTitle("iHabit")
            .toolbar {
                HStack {
                    EditButton()
                    Button {
                        isShowingAddActivity.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingAddActivity) {
            AddActivityView(activities: activities)
        }
    }
    func deleteActivity(at offSets: IndexSet) {
        activities.activities.remove(atOffsets: offSets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
