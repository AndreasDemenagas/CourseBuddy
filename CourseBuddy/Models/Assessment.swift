//
//  Assessment.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

enum PaperType: String {
    case paper = "Paper"
    case oral = "Oral"
}

enum AssessmentType: String {
    case internalAssessment = "Internal"
    case externalAssessment = "External"
}

//struct Assessmentt: Hashable {
//    let name: String
//    let paperType: PaperType
//    let heighting: Int
//    let gradingType: AssessmentType
//}
//
//struct AssessmentsBank {
//    static let dictionary: [String: [Assessmentt]] = [
//        "Modern Greek A: Literature":  [
//            .init(name: "Paper 1", paperType: .paper, heighting: 20, gradingType: .externalAssessment),
//            .init(name: "Paper 2", paperType: .paper, heighting: 20, gradingType: .externalAssessment),
//            .init(name: "Paper 3", paperType: .paper, heighting: 20, gradingType: .externalAssessment),
//            .init(name: "Written Assignment", paperType: .oral, heighting: 20, gradingType: .internalAssessment),
//            .init(name: "Oral Commentarty", paperType: .oral, heighting: 20, gradingType: .internalAssessment)
//        ],
//        "Computer Science":  [
//            .init(name: "Paper 1", paperType: .paper, heighting: 60, gradingType: .externalAssessment),
//            .init(name: "Paper 2", paperType: .paper, heighting: 20, gradingType: .externalAssessment),
//            .init(name: "Paper 3", paperType: .paper, heighting: 20, gradingType: .externalAssessment)
//        ]
//    ]
//}

