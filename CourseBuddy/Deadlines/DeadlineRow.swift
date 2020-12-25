//
//  DeadlineRow.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import SwiftUI

struct DeadlineRow: View {
    let deadline: CourseTask
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(deadline.title ?? "")
                        .bold()
                        .font(.title3)
                    Text("Due: \(deadline.dueDate ?? Date(), formatter: dateFormatter)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(getCourseText())
            }
            Spacer()
            DeadlineRowPriorityView(priority: deadline.courseTaskPriority)
        }
        .padding(.vertical)
    }
    
    func getCourseText() -> String {
        if let courseName = deadline.course?.name {
            if let level = deadline.course?.courseLevel.rawValue {
                return courseName + " " + level
            }
        }
        return ""
    }
}

struct DeadlineRow_Previews: PreviewProvider {
    static var previews: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            DeadlineRow(deadline: CourseTask.example)
        }
        
    }
}

