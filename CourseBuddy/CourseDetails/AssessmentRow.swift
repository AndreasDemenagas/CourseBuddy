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
                Text(assessment.name)
                    .bold()
                Text("\(assessment.heighting)%")
            }
            Spacer()
            if(assessment.assessentType == .externalAssessment) {
                Text(assessment.assessentType.rawValue)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            else {
                Text(assessment.assessentType.rawValue)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            if(assessment.paperType == .paper) {
                Text(assessment.paperType.rawValue)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            else {
                Text(assessment.paperType.rawValue)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
