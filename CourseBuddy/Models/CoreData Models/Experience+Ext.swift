//
//  Experience+Ext.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import Foundation

enum CASExperienceType: String, CaseIterable {
    case creativity = "Creativity"
    case activity = "Activity"
    case service = "Service"
}

extension CASExperience {
    var experienceType: CASExperienceType {
        get {
            return CASExperienceType(rawValue: self.type!)!
        }
        
        set {
            self.type = newValue.rawValue
        }
    }
}

