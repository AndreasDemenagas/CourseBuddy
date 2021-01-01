//
//  ExperienceRowTypeView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 2/1/21.
//

import SwiftUI

struct ExperienceViewTypeView: View {
    let type: CASExperienceType
    
    var body: some View {
        Text(getText())
            .fontWeight(.heavy)
            .padding(12)
            .foregroundColor(.white)
            .background(getBackground())
            .clipShape(Circle())
    }
    
    func getBackground() -> Color {
        switch type {
        case .creativity:
            return .blue
        case .activity:
            return .green
        case .service:
            return .red
        }
    }
    
    func getText() -> String {
        switch type {
        case .creativity:
            return "C"
        case .activity:
            return "A"
        case .service:
            return "S"
        }
    }
}
