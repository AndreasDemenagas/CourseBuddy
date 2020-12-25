//
//  CourseListCell.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import UIKit

class CourseListCell: UICollectionViewCell {
    
    static let id = "CourseCellID"
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .label
        lbl.lineBreakMode = .byWordWrapping
        lbl.font = UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 18))
        return lbl
    }()
    
    private let detailsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var courseLevelView: CourseLevelCellView = {
        let sv = CourseLevelCellView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    var course: Course? {
        didSet {
            guard let course = course else { return }
            configureCell(with: course)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    fileprivate func setupViews() { 
        
        let vStack = UIStackView(arrangedSubviews: [nameLabel, detailsLabel])
        vStack.axis = .vertical
        vStack.spacing = 4
        
        let stack = UIStackView(arrangedSubviews: [vStack, courseLevelView])
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        
        addSubview(stack)
        addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            courseLevelView.widthAnchor.constraint(equalToConstant: 30),
            courseLevelView.heightAnchor.constraint(equalToConstant: 30),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42)
        ])
        
        separatorLine.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: .zero, height: 1))
    }
    
    private func configureCell(with course: Course) {
        nameLabel.text = course.name
        detailsLabel.text = course.courseYear.rawValue
        courseLevelView.level = course.courseLevel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

