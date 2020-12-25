//
//  MainTabBarController.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import SwiftUI

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = Constants.Colors.mainGreen
        tabBar.barStyle = .black
        tabBar.isTranslucent = false
        
        let casController = navigationController(viewController: UIViewController(), imageName: Constants.Images.casTabBar, title: "CAS")
        let groupsController = navigationController(viewController: UIViewController(), imageName: Constants.Images.groupsTabBar, title: "Groups")
        
        viewControllers = [
            coursesController(),
            deadlinesController(),
            casController,
            groupsController
        ]
    }
    
    private func deadlinesController() -> UINavigationController {
        let context = CoreDataManager.shared.context
        let deadlinesView = DeadlinesView().environment(\.managedObjectContext, context)
        let deadlinesHostingViewController = UIHostingController(rootView: deadlinesView)
        let deadlinesController = navigationController(viewController: deadlinesHostingViewController, imageName: Constants.Images.calendarTabBar, title: "Deadlines")
        return deadlinesController
    }
    
    private func coursesController() -> UINavigationController {
        let courseCollectionViewController = CoursesViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let coursesController = navigationController(viewController: courseCollectionViewController, imageName: Constants.Images.coursesTabBar, title: "Courses")
        return coursesController
    }
    
    private func navigationController(viewController: UIViewController, imageName: String, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
        viewController.tabBarItem.image = UIImage(systemName: imageName)
        return navigationController
    }
    
}
