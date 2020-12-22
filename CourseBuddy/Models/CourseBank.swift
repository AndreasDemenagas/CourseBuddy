//
//  CourseBank.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

struct CourseBank {
    static let groups: [CourseGroup] = [
        CourseGroup(number: 1, name: .language, courses: [
            "English A: Language and Literature",
            "Modern Greek A: Literature"
        ]),
        CourseGroup(number: 2, name: .acquisition, courses: [
            "English B"
        ]),
        CourseGroup(number: 3, name: .humanities, courses: [
            "Business Management",
            "Economics",
            "History"
        ]),
        CourseGroup(number: 4, name: .sciences, courses: [
            "Physics",
            "Computer Science",
            "Biology"
        ]),
        CourseGroup(number: 5, name: .maths, courses: [
            "Analysis and Approaches",
            "Application and Interpretation"
        ]),
        CourseGroup(number: 6, name: .arts, courses: [
            "Film",
            "Visual Arts",
            "Theatre"
        ])
    ]
}
