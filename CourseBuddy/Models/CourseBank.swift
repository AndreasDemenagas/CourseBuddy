//
//  CourseBank.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

struct CourseBank {
    static let groups: [CourseGroup] = [
        CourseGroup(name: .language, courses: [
            "English A: Language and Literature",
            "Modern Greek A: Literature"
        ]),
        CourseGroup(name: .acquisition, courses: [
            "English B"
        ]),
        CourseGroup(name: .humanities, courses: [
            "Business Management",
            "Economics",
            "History"
        ]),
        CourseGroup(name: .sciences, courses: [
            "Physics",
            "Computer Science",
            "Biology"
        ]),
        CourseGroup(name: .maths, courses: [
            "Mathematics: Analysis and Approaches",
            "Mathematics: Application and Interpretation"
        ]),
        CourseGroup(name: .arts, courses: [
            "Film",
            "Visual Arts",
            "Theatre"
        ])
    ]
}

struct CourseGroup {
    let name: Group
    let courses: [String]
    
    enum Group: String {
        case language = "Studies in Language and Literature"
        case acquisition = "Language Acquisition"
        case humanities = "Individuals and Societies"
        case sciences = "Experimental Sciences"
        case maths = "Mathematics"
        case arts = "The Arts"
    }
}
