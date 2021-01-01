//
//  AddExperienceView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import SwiftUI

struct AddExperienceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("Add View....")
            }
        }
    }
}

struct AddExperienceView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            AddExperienceView()
                .navigationBarTitle("Add New", displayMode: .inline)
        }
    }
}
