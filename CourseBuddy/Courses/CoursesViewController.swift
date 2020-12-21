//
//  CoursesViewController.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import UIKit

class CoursesViewController: UICollectionViewController {
    
    let noCourseLabel: UILabel = {
        let label = UILabel()
        label.text = "You have no added courses.\n\nPlease add one using the button above."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 18))
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.addSubview(noCourseLabel)
        noCourseLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left: 80, bottom: 0, right: 60))
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        noCourseLabel.transform = CGAffineTransform(translationX: 0, y: y)
    }
    
}
