//
//  CourseConfigView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct CourseConfigView: View {
    let course: String
    let group: CourseGroup
    
    @State private var level: Level = .sl
    @State private var year: CourseYear = .both
    
    var dismiss: (() -> ())?
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 18) {
                Text("Title: \(course)")
                    .font(.headline)
                Text("Group \(group.number): \(group.name.rawValue)")
                Divider()
                Text("Choose year(s)")
                Picker(selection: $year, label: Text("Select year: ")) {
                    ForEach(CourseYear.allCases, id: \.self) { yearOption in
                        Text(yearOption.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Divider()
                Text("Level: \(level.rawValue)")
                Picker(selection: $level, label: Text("Select level: ")) {
                    ForEach(Level.allCases, id: \.self) { level in
                        Text(level.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Divider()
                Button(action: {
                    print("Adding course: \(course) at level \(level.rawValue)")
                    self.createCourse(title: course, level: level, year: year)
                }, label: {
                    HStack {
                        Spacer()
                        Text("Add Course")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(15)
                    .padding()
                })
            }
            .padding()
        }
        .navigationBarTitle(course, displayMode: .inline)
    }
    
    func createCourse(title: String, level: Level, year: CourseYear) {
        CoreDataManager.shared.createCourse(title: title, level: level) { (result) in
            switch result {
            case .failure(let error):
                print("Error creating course object ", error)
            case .success(_):
                print("Created course...")
                self.dismiss?()
            }
        }
    }
}

struct CourseConfigView_Previews: PreviewProvider {
    static var previews: some View {
        CourseConfigView(course: "English B", group: .init(number: 3, name: .humanities, courses: []))
    }
}
