//
//  CourseDetailsView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

enum CourseDetailsViewTypes {
    case assessment, tasks
}

struct CourseDetailsView: View {
    
    @State var course: Course
    
    @State private var showingAddView = false
    @State private var detailsViewToBePresented: CourseDetailsViewTypes = .assessment
    
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
                    self.showingAddView = true
                    self.detailsViewToBePresented = .assessment
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
                Button(action: {
                    self.showingAddView = true
                    self.detailsViewToBePresented = .tasks
                }, label: {
                    Text("Add Tasks")
                })
            }
        }
        .fullScreenCover(isPresented: $showingAddView) {
            if self.detailsViewToBePresented == .assessment {
                AddAssessmentView(isPresented: $showingAddView, course: $course)
            }
            else if self.detailsViewToBePresented == .tasks {
                AddTaskView(isPresented: $showingAddView, course: $course)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(course.name ?? "", displayMode: .inline)
    }
}




