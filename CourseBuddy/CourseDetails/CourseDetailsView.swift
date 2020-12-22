//
//  CourseDetailsView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct CourseDetailsView: View {
    
    @State var course: Course
    @State private var showingAddAssessmentView = false
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                CourseDetailsViewDetailsSection(course: course)
            }
            
            Section(header: Text("Assessments")) {
                NavigationLink(destination: AsssementsView(course: $course)) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("View Assessments")
                    }
                }
                Button(action: {
                    self.showingAddAssessmentView = true
                }, label: {
                    Text("Add Assessment")
                })
            }
            
            Section(header: Text("Units")) {
                NavigationLink(destination: Text(course.name!)) {
                    HStack {
                        Image(systemName: "text.book.closed.fill")
                        Text("View Units")
                    }
                }
                NavigationLink(destination: Text(course.name!)) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Add Unit")
                    })
                }
            }
            
            Section(header: Text("Tasks")) {
                NavigationLink(destination: Text(course.name!)) {
                    HStack {
                        Image(systemName: "calendar")
                        Text("View Tasks")
                    }
                }
                NavigationLink(destination: Text(course.name!)) {
                    Button(action: {}, label: {
                        Text("Add Tasks")
                    })
                }
            }
        }
        .fullScreenCover(isPresented: $showingAddAssessmentView) {
            AddAssessmentView(isPresented: $showingAddAssessmentView, course: $course)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(course.name ?? "", displayMode: .inline)
    }
}




