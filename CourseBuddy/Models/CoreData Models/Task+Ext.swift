//
//  Task+Ext.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import Foundation

enum TaskPriority: String, CaseIterable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

extension CourseTask {
    var courseTaskPriority: TaskPriority {
        get {
            return TaskPriority(rawValue: self.priority!)!
        }
        set {
            self.priority = newValue.rawValue
        }
    }
    
    var taskDueDate: Date {
        get {
            return self.dueDate!
        }
    }
    
    static var example: CourseTask {
        let task = CourseTask(context: CoreDataManager.shared.context)
        task.title = "Draft Essay V01"
        task.courseTaskPriority = .medium
        task.dueDate = Date()
        task.isDeliverable = true
        return task
    }
}

