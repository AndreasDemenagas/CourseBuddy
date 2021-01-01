//
//  NoExperiencesView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 1/1/21.
//

import SwiftUI

struct NoExperiencesView: View {
    
    var body: some View {
        VStack(spacing: 50) {
            Text("You have no added experiences.\nYou can add one using the button below.")
                .bold()
                .multilineTextAlignment(.center)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Add Experience")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.green)
                    .cornerRadius(10)
            })
        }
    }
    
}

struct NoExperiencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoExperiencesView()
                .navigationBarTitle("CAS")
        }
    }
}
