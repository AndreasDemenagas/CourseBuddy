//
//  CourseDetailsView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct CourseDetailsView: View {
    
    @State var course: Course
    
    @State private var showingAddTaskView = false
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
                .fullScreenCover(isPresented: $showingAddAssessmentView) {
                    AddAssessmentView(isPresented: $showingAddAssessmentView, course: $course)
                }
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
                Button(action: {
                    self.showingAddTaskView = true
                }, label: {
                    Text("Add Tasks")
                })
                .fullScreenCover(isPresented: $showingAddTaskView) {
                    AddTaskView(isPresented: $showingAddTaskView, course: $course)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(course.name ?? "", displayMode: .inline)
    }
}




