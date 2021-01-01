//
//  ExperienceRow.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 2/1/21.
//

import SwiftUI

struct ExperienceRow: View {
    
    var experience: CASExperience
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ExperienceViewTypeView(type: experience.experienceType)
            VStack(alignment: .leading, spacing: 0) {
                Text(experience.name!)
                    .font(.title3)
                    .bold()
                Text("\(experience.startDate!, formatter: dateFormatter) - \(experience.endDate!, formatter: dateFormatter)")
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
            }
            if experience.isProject {
                Spacer()
                ExperienceRowProjectView()
            }
        }
        .padding(.vertical)
    }
}

struct ExperienceRow_Previews: PreviewProvider {
    static var previews: some View {
        List(1..<10) { _ in
            ExperienceRow(experience: CASExperience.example)
        }
    }
}
