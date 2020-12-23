//
//  AddAssessmentView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct AddAssessmentView: View {
    
    @Binding var isPresented: Bool
    
    @Binding var course: Course
    
    @State private var gradingType: GradingType = .externalAssessment
    @State private var paperType: PaperType = .paper
    @State private var weighting: String = ""
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Assessment name", text: $name)
                }
                
                Section(header: Text("Grading Type")) {
                    Picker(selection: $gradingType, label: Text("Select grading type: ")) {
                        ForEach(GradingType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Assessment Type")) {
                    Picker(selection: $paperType, label: Text("Select paper type: ")) {
                        ForEach(PaperType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Percent Weighting")) {
                    TextField("Assessment Weighting %", text: ($weighting))
                        .keyboardType(.numberPad)
                }
                
                Button(action: {
                    self.isPresented = false
                    createAssessment { (course) in
                        self.course = course
                    }
                }, label: {
                    Text("Create")
                })
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.isPresented = false
            }, label: {
                Text("Back")
            }))
            .gesture(DragGesture().onChanged({ (_) in
                self.hideKeyboard()
            }))
        }
    }
    
    func createAssessment(completion: @escaping (Course) -> ()) {
        CoreDataManager.shared.createAssessment(for: course, name: name, gradingType: gradingType, paperType: paperType, weighting: weighting) { (result) in
            switch result {
            case .failure(let error):
                print("Error ", error )
            case .success(let course):
                completion(course)
            }
        }
    }
}

