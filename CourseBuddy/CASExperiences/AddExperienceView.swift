//
//  AddExperienceView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import SwiftUI

struct AddExperienceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type: CASExperienceType = .creativity
    @State private var isProject = false
    
    @State private var startDate = Date()
    @State private var endDate = Date().addingTimeInterval(86400)
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Activity Name")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Activity Type")) {
                    Picker(selection: $type, label: Text("Select experience type")) {
                        ForEach(CASExperienceType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Start Date")) {
                    DatePicker(selection: $startDate, displayedComponents: .date) {
                        Text("Select a start date")
                    }
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                }
                
                Section(header: Text("End Date")) {
                    DatePicker(selection: $endDate, displayedComponents: .date) {
                        Text("Select an end date")
                    }
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                }
                
                Section(header: Text("CAS Project")) {
                    Toggle(isOn: $isProject) {
                        Text("This is a CAS Project")
                            .font(.subheadline)
                    }
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.createCASExperience()
                }, label: {
                    Text("Add")
                })
            }
            .navigationBarTitle("Add New", displayMode: .inline)
            .navigationBarItems(leading: Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func createCASExperience() {
        CoreDataManager.shared.createCASExperience(name: name, type: type, start: startDate, end: endDate, isProject: isProject)
    }
}

struct AddExperienceView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddExperienceView()
    }
}
