//
//  AddCourseView.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

struct AddCourseView: View {
    var dismiss: (() -> ())?
    
    var body: some View {
        VStack {
            Text("Hello People SwiftUI")
            Button(action: dismiss!, label: {
                Text("Add Course")
            })
        }
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView()
    }
}
