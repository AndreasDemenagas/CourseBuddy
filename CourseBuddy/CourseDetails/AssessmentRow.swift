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
            Text(assessment.gradingType!)
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
            Text(assessment.paperType!)
                .padding()
                .background(Color.pink)
                .cornerRadius(10)
        }
        .padding()
    }
}
