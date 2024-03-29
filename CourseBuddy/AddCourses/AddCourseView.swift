//
//  AddCourseView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct AddCourseView: View {
    var dismiss: (() -> ())?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(CourseBank.groups, id: \.self) { group in
                    Section(header: Text(group.name.rawValue)) {
                        ForEach(group.courses, id: \.self) { course in
                            NavigationLink(destination: CourseConfigView(course: course, group: group, dismiss: dismiss)) {
                                Text(course)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Add Course")
            .navigationBarItems(trailing: Button(action: dismiss!, label: {
                Text("Back")
            }))
            .listStyle(GroupedListStyle())
        }
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView()
    }
}
