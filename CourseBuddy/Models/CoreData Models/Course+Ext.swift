//
//  Course+Ext.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import Foundation


extension Course {
    var courseLevel: Level {
        get {
            return Level(rawValue: self.level!)!
        }
        set {
            self.level = newValue.rawValue
        }
    }
    
    var courseYear: CourseYear {
        get {
            return CourseYear(rawValue: self.year!)!
        }
        set {
            self.year = newValue.rawValue
        }
    }
}

