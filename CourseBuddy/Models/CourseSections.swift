//
//  CourseSections.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

struct CourseSection: Identifiable  {
    var id = UUID().uuidString
    let header: String
    let items: [CourseSectionItem]
}

struct CourseSectionItem: Hashable {
    let title: String
}

struct CourseSections {
    static let sections: [CourseSection] = [
        .init(header: "Details", items: [
            .init(title: "Name"),
            .init(title: "Level"),
            .init(title: "Years")
        ]),
        .init(header: "Assessments", items: [
            .init(title: "Add Assessment")
        ])
    ]
}
