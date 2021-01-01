//
//  Experience+Ext.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import Foundation

enum CASExperienceType: String {
    case creativity = "Creativity"
    case activity = "Activity"
    case service = "Service"
}

extension ExperienceType {
    var experienceType: CASExperienceType {
        get {
            return CASExperienceType(rawValue: self.name!)!
        }
        
        set {
            self.name = newValue.rawValue
        }
    }
}

