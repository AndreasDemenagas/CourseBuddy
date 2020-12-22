//
//  CourseDetailsViewDetailsSection.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct CourseDetailsViewDetailsSection: View {
    let course: Course
    
    var body: some View {
        Text("IB DP: \(course.name!)")
            .bold()
        if (course.courseLevel == .hl) {
            Text("Higher Level")
        } else {
            Text("Standard Level")
        }
        Text(course.year!)
    }
}
