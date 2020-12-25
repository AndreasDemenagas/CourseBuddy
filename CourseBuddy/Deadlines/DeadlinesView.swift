//
//  DeadlinesView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import SwiftUI

struct DeadlinesView: View {
    
    @FetchRequest(entity: CourseTask.entity(), sortDescriptors: []) var tasks: FetchedResults<CourseTask>
    
    var body: some View {
        if tasks.isEmpty {
            NoDeadlinesView()
        } else {
            List {
                ForEach(tasks, id: \.self) { task in
                    DeadlineRow(deadline: task)
                }
            }
        }
    }
}
