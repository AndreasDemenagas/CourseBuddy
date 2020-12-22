//
//  CoreDataManager.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var context = persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CourseBuddy")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func fetchCompanies() -> [Course] {
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        
        do {
            let courses = try context.fetch(fetchRequest)
            return courses
        }
        
        catch {
            print("Error fetching courses")
            return []
        }
    }
    
    func createCourse(title: String, level: Level, completion: @escaping (Result<Course, Error>) -> ()) {
        let course = Course(context: context)
        course.name = title
        course.level = level.rawValue
        
        do {
            try context.save()
            completion(.success(course))
        }
        
        catch let error {
            completion(.failure(error))
        }
    }
 
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
