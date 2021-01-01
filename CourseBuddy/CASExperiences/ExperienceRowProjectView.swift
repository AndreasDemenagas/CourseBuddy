//
//  ExperienceRowProjectView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 2/1/21.
//

import SwiftUI

struct ExperienceRowProjectView: View {
    var body: some View {
        Image(systemName: "cube.transparent")
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding(4)
            .background(Color.purple)
            .cornerRadius(10)
    }
}

struct ExperienceRowProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceRowProjectView()
    }
}
