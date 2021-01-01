//
//  Models+Examples.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import Foundation

#if DEBUG
extension Course {
    
    static var example: Course {
        let course = Course(context: CoreDataManager.shared.context)
        course.name = "Computer Science"
        course.courseLevel = .hl
        return course
    }
}

extension CourseTask {
    
    static var example: CourseTask {
        let task = CourseTask(context: CoreDataManager.shared.context)
        task.title = "Draft Essay V01"
        task.courseTaskPriority = .medium
        task.dueDate = Date()
        task.isDeliverable = true
        
        task.course = Course.example
        return task
    }
}

extension CASExperience {
    static var example: CASExperience {
        let exp = CASExperience(context: CoreDataManager.shared.context)
        exp.name = "Book Club"
        return exp 
    }
}

#endif
