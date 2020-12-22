//
//  CourseDetailsView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct CourseDetailsView: View {
    
    let course: Course
    let sections = CourseSections.sections
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                CourseDetailsViewDetailsSection(course: course)
            }
            
            Section(header: Text("Assessments")) {
                NavigationLink(destination: Text(course.name!)) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("View Assessments")
                    }
                }
                NavigationLink(destination: Text(course.name!)) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Add Assessment")
                    })
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
                NavigationLink(destination: Text(course.name!)) {
                    Button(action: {}, label: {
                        Text("Add Tasks")
                    })
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(course.name ?? "", displayMode: .inline)
    }
}

//struct CourseDetailsView_Previews: PreviewProvider {
//    let course = Course.init(context: CoreDataManager.shared.context)
//    static var previews: some View {
//        CourseDetailsView(course: course)
//    }
//}

//struct CourseDetailsView: View {
//    let course: Course
//
//    let sections = CourseSections.sections
//
//    var body: some View {
//        List {
//            ForEach(sections) { section in
//                Section(header: Text(section.header)) {
//                    ForEach(section.items, id: \.self) { item in
//                        Text(item.title)
//                    }
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
//        .navigationBarTitle(course.name ?? "", displayMode: .inline)
//    }
//}
