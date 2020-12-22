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
    
    func fetchCourses() -> [Course] {
        print("Fetching")
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
    
    func createAssessment(for course: Course, name: String, gradingType: GradingType, paperType: PaperType, weighting: String, completion: @escaping (Result<Course, Error>) -> ()) {
        
        let assessment = Assessment(context: context)
        
        assessment.course = course
        assessment.name = name
        assessment.weighting = Int32(weighting) ?? 0
        
        assessment.gradingType = gradingType.rawValue
        assessment.assessmentGradingType = gradingType
        
        assessment.paperType = paperType.rawValue
        assessment.assessmentPaperType = paperType
        
        do {
            try context.save()
            completion(.success(course))
        }
        
        catch let error {
            print("failed to save context....")
            completion(.failure(error))
        }
    }
    
    func createCourse(title: String, level: Level, year: CourseYear, completion: @escaping (Result<Course, Error>) -> ()) {
        let course = Course(context: context)
        course.name = title
        
        course.level = level.rawValue
        course.courseLevel = level
        
        course.year = year.rawValue
        course.courseYear = year
        
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
    
    func resetCourses() {
        let context = persistentContainer.viewContext
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Course.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
            print("Deleted all Course objects....")
        }
        catch {
            print("Failed to batch delete...")
        }
    }
    
}
