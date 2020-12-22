//
//  CourseTasksView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import SwiftUI

struct CourseTasksView: View {
    
    @Binding var course: Course
    
    var tasks: [CourseTask] {
        course.tasks?.allObjects as? [CourseTask] ?? []
    }
    
    var body: some View {
        if tasks.isEmpty {
            Text("This course has no tasks.")
                .bold()
                .navigationBarTitle("Tasks")
        } else {
            List {
                ForEach(self.tasks, id: \.self) { task in
                    Text(task.title!)
                }
            }
            .navigationBarTitle("Tasks")
        }
    }
}
