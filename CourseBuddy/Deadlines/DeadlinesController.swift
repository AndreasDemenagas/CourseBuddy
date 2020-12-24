//
//  DeadlinesController.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 25/12/20.
//

import SwiftUI

class DeadlinesController: UIHostingController<DeadlinesView> {
    
    override init(rootView: DeadlinesView) {
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
