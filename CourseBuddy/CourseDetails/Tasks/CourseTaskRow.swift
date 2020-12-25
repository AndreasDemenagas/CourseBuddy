//
//  CourseTaskRow.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import SwiftUI

struct CourseTaskRow: View {
    let task: CourseTask
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(task.title!)
                        .font(.headline)
                    Text("\(getDueTextStart()) \(task.dueDate!, formatter: dateFormatter)")
                        .font(.subheadline)
                        .foregroundColor(getDueTextColor())
                }
                Text(task.priority!)
                    .bold()
                    .foregroundColor(priorityColor())
            }
            Spacer()
            if task.isDeliverable {
                Image(systemName: Constants.Images.deliverableTaskIcon)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        .padding(.vertical)
    }
    
    func getDueTextStart() -> String {
        return task.isOverdue ? "Overdue:" : "Due"
    }
    
    func getDueTextColor() -> Color {
        return task.isOverdue ? .red : .secondary
    }
    
    func priorityColor() -> Color {
        switch task.courseTaskPriority {
        case .low:
            return .blue
        case .medium:
            return .green
        case .high:
            return .red
        }
    }
}

struct CourseTaskRow_Previews: PreviewProvider {
    static var previews: some View {
        List(0..<5) { _ in
            CourseTaskRow(task: CourseTask.example)
        }
    }
}
