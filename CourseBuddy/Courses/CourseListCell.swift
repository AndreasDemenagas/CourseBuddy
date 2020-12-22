//
//  CourseListCell.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import UIKit

class CourseListCell: UICollectionViewListCell {
    
    var course: Course?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accessories = [.disclosureIndicator()]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var content = defaultContentConfiguration()
        
        content.text = course?.name
        content.secondaryText = "Level: \(course?.courseLevel.rawValue ?? "SHL")"
        content.directionalLayoutMargins = .init(top: 20, leading: 0, bottom: 20, trailing: 0)
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 18)
        
        content.textToSecondaryTextVerticalPadding = 10
        
        contentConfiguration = content
    }
    
}
