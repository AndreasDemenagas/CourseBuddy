//
//  AddTaskView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 23/12/20.
//

import SwiftUI

struct AddTaskView: View {
    
    @Binding var isPresented: Bool
    
    @Binding var course: Course
    
    var body: some View {
        NavigationView {
            Text("AAAA")
                .navigationBarTitle("Add Task", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    self.isPresented = false
                }, label: {
                    Text("Back")
                }))
        }
    }
}
