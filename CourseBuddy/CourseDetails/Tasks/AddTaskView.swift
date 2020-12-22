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
    
    @State private var taskTitle: String = ""
    @State private var taskPriority: TaskPriority = .medium
    @State private var isTaskDeliverable = false
    @State private var dueDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Title")) {
                    TextField("Task title", text: $taskTitle)
                }
                
                Section(header: Text("Task Priority")) {
                    Picker(selection: $taskPriority, label: Text("Select task priority")) {
                        ForEach(TaskPriority.allCases, id: \.self) { priority in
                            Text(priority.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Is Deliverable")) {
                    Toggle(isOn: $isTaskDeliverable) {
                        Text("Needs upload files")
                            .font(.subheadline)
                    }
                }
                
                Section(header: Text("Due Date")) {
                    DatePicker(selection: $dueDate, in: Date()..., displayedComponents: .date) {
                        Text("Select a date")
                    }
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                }
                
                Button(action: {
                    self.isPresented = false
                    self.createAssessment { (course) in
                        self.course = course
                    }
                }, label: {
                    Text("Create")
                })
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.isPresented = false
            }, label: {
                Text("Back")
            }))
        }
    }
    
    func createAssessment(completion: @escaping (Course) -> ()) {
        CoreDataManager.shared.createCourseTask(for: course, title: taskTitle, isDeliverable: isTaskDeliverable, dueDate: dueDate, priority: taskPriority) { (result) in
            switch result {
            case .failure(let error):
                print("Error ", error )
            case .success(let course):
                completion(course)
            }
        }
    }
}
