//
//  Assessment.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation

enum PaperType: String, CaseIterable {
    case paper = "Paper"
    case oral = "Oral"
}

enum GradingType: String, CaseIterable {
    case internalAssessment = "Internal"
    case externalAssessment = "External"
}

extension Assessment {
    var assessmentGradingType: GradingType {
        get {
            return GradingType(rawValue: self.gradingType!)!
        }
        set {
            self.gradingType = newValue.rawValue
        }
    }
    
    var assessmentPaperType: PaperType {
        get {
            return PaperType(rawValue: self.paperType!)!
        }
        set {
            self.paperType = newValue.rawValue
        }
    }
}


