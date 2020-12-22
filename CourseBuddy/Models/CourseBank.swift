//
//  CourseBank.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

enum Level: String, CaseIterable {
    case hl = "HL"
    case sl = "SL"
}

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

struct CourseGroup: Hashable {
    let number: Int
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
