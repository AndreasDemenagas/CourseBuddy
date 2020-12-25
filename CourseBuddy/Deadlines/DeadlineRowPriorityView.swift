//
//  DeadlineRowPriorityView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import SwiftUI

struct DeadlineRowPriorityView: View {
    let priority: TaskPriority
    
    var body: some View {
        Text(getText())
            .fontWeight(.heavy)
            .padding(12)
            .foregroundColor(.white)
            .background(getBackground())
            .clipShape(Circle())
    }
    
    func getBackground() -> Color {
        switch priority {
        case .low:
            return .blue
        case .medium:
            return .green
        case .high:
            return .red
        }
    }
    
    func getText() -> String {
        switch priority {
        case .low:
            return "L"
        case .medium:
            return "M"
        case .high:
            return "H"
        }
    }
}
