//
//  ExperiencesView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import SwiftUI

struct ExperiencesView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: CASExperience.entity(), sortDescriptors: []) var experiences: FetchedResults<CASExperience>
    
    @State private var isAddPresented = false
    
    var body: some View {
        if experiences.isEmpty {
            NoExperiencesView(onButtonClick: {
                self.isAddPresented = true
                print("Button Clicked...")
            })
            .fullScreenCover(isPresented: $isAddPresented, content: {
                AddExperienceView()
            })
            .transformEffect(.init(translationX: 0, y: -40))
        } else {
            List {
                ForEach(experiences, id: \.self) { experience in
                    ExperienceRow(experience: experience)
                }
                .onDelete(perform: deleteActivity)
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing: Button("Add") {
                self.isAddPresented.toggle()
            })
            .fullScreenCover(isPresented: $isAddPresented, content: {
                AddExperienceView()
            })
        }
    }
    
    private func deleteActivity(indexSet: IndexSet) {
        for index in indexSet {
            let experience = experiences[index]
            context.delete(experience)
            
            do {
                try context.save()
            } catch {
                print("Error deleting experience....")
            }
        }
    }
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExperiencesView()
                .navigationBarTitle("CAS")
        }
    }
}
