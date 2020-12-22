//
//  CourseDetailsController.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI
import UIKit

class CourseDetailsController: UIHostingController<CourseDetailsView> {
    
    override init(rootView: CourseDetailsView) {
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
