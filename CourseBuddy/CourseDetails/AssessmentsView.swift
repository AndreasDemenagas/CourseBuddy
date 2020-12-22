//
//  AssessmentsView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct AsssementsView: View {
    let assessments: [Assessment]
    var body: some View {
        if(assessments.isEmpty) {
            Text("This course has no assessments.")
                .navigationBarTitle("Assessments")
        } else {
            List {
                ForEach(assessments, id: \.self) { assessment in
                    AssessmentRow(assessment: assessment)
                }
            }
            .navigationBarTitle("Assessments")
        }
    }
}
