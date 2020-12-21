//
//  AddCourseViewController.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import UIKit
import SwiftUI

class AddCourseController: UIHostingController<AddCourseView> {
    
    override init(rootView: AddCourseView) {
        super.init(rootView: rootView)
        self.rootView.dismiss = dismiss
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
