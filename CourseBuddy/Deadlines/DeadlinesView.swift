//
//  DeadlinesView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import SwiftUI

struct DeadlinesView: View {
    @State private var tasks: [CourseTask] = []
    
    var allTasks: [CourseTask] {
        CoreDataManager.shared.fetchDeadlines()
    }
    
    var body: some View {
        if allTasks.isEmpty {
            NoDeadlinesView()
        } else {
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task.title!)
                }
            }
            .onAppear {
                self.tasks = allTasks
            }
        }
    }
}
