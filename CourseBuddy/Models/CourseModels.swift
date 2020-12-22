//
//  CourseModels.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

enum Level: String, CaseIterable {
    case sl = "SL"
    case hl = "HL"
}

enum CourseYear: String, CaseIterable {
    case yearOne = "Year 1"
    case yearTwo = "Year 2"
    case both = "Both Years"
}

struct CourseGroup: Hashable {
    let number: Int
    let name: Group
    let courses: [String]
    
    enum Group: String {
        case core = "Core Subjects"
        case language = "Studies in Language and Literature"
        case acquisition = "Language Acquisition"
        case humanities = "Individuals and Societies"
        case sciences = "Experimental Sciences"
        case maths = "Mathematics"
        case arts = "The Arts"
    }
}
