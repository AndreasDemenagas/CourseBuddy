//
//  CoreDataManager+Ext.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import CoreData

extension CoreDataManager {
    
    func resetCoreDateObjects() {
        let context = persistentContainer.viewContext
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Course.fetchRequest())
        let tasksDelete = NSBatchDeleteRequest(fetchRequest: CourseTask.fetchRequest())
        let assessmentDelete = NSBatchDeleteRequest(fetchRequest: Assessment.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
            try context.execute(tasksDelete)
            try context.execute(assessmentDelete)
            print("Deleted all Course objects....")
        }
        catch {
            print("Failed to batch delete...")
        }
    }
    
}
