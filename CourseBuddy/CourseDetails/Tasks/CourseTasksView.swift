//
//  CourseTasksView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import SwiftUI

struct CourseTasksView: View {
    
    @Binding var course: Course
    
    @State var courseTasks: [CourseTask] = []
    
    var tasks: [CourseTask] {
        let array = course.tasks?.allObjects as? [CourseTask] ?? []
        return array.sort(by: \.taskDueDate)
    }
    
    var body: some View {
        if tasks.isEmpty {
            Text("This course has no tasks.")
                .bold()
                .navigationBarTitle("Tasks")
        } else {
            List {
                ForEach(self.courseTasks, id: \.self) { task in
                    CourseTaskRow(task: task)
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Tasks")
            .onAppear {
                courseTasks = self.tasks
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        let taskToDelete = offsets.map { self.tasks[$0] }.first!
        self.courseTasks.remove(atOffsets: offsets)
        CoreDataManager.shared.deleteCourseTasks(task: taskToDelete)
    }
}
