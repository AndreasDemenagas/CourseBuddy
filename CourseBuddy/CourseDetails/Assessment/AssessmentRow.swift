//
//  AssessmentRow.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct AssessmentRow: View {
    let assessment: Assessment
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(assessment.name!)
                    .bold()
                Text("\(assessment.heighting)%")
            }
            Spacer()
            if assessment.assessmentGradingType == .externalAssessment {
                Text(assessment.gradingType!)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            } else {
                Text(assessment.gradingType!)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            if assessment.assessmentPaperType == .paper {
                Text(assessment.paperType!)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            } else {
                Text(assessment.paperType!)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
