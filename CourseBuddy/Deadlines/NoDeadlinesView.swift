//
//  NoDeadlinesView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import SwiftUI

struct NoDeadlinesView: View {
    var body: some View {
        Text("You have no dealines yet!\nIf you add some there will show up here.")
            .bold()
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}
