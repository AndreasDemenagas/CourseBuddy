//
//  ExperiencesView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import SwiftUI

struct ExperiencesView: View {
    
    //@FetchRequest(entity: CASExperience.entity(), sortDescriptors: []) var experiences: FetchedResults<CASExperience>
    
    @State private var isAddPresented = false
    
    var experiences = [CASExperience.example, CASExperience.example, CASExperience.example]
    
    var body: some View {
        if experiences.isEmpty {
            NoExperiencesView()
                .transformEffect(.init(translationX: 0, y: -40))
        } else {
            List {
                ForEach(experiences, id: \.self) { experience in
                    Text(experience.name!)
                }
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
}

struct ExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExperiencesView()
                .navigationBarTitle("CAS")
        }
    }
}
