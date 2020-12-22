//
//  CoursesViewController.swift
//  CourseBuddy
//
//  Created by Andrew Demenagas on 22/12/20.
//

import UIKit
import SwiftUI

class CoursesViewController: UICollectionViewController {
    
    let noCourseLabel: UILabel = {
        let label = UILabel()
        label.text = "You have no added courses.\n\nPlease add one using the button above."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 18))
        return label
    }()
    
    private enum Section {
        case main
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Course>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        //CoreDataManager.shared.resetCourses()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //TODO: Fetches in every appearance of the view, find a better way (closures, delegates....)
        fetchCourses()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.addSubview(noCourseLabel)
        collectionView.register(CourseListCell.self, forCellWithReuseIdentifier: CourseListCell.id)
        
        dataSource = UICollectionViewDiffableDataSource<Section, Course>(collectionView: collectionView) { (collectionView, indexPath, course) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseListCell.id, for: indexPath) as! CourseListCell
            cell.course = course
            return cell
        }
    }
    
    func populateList(with circuits: [Course]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Course>()
        snapshot.appendSections([.main])
        snapshot.appendItems(circuits)
        dataSource?.apply(snapshot)
    }
    
    private func fetchCourses() {
        let courses = CoreDataManager.shared.fetchCourses()
        
        if courses.count == 0 {
            showNoCoursesLabel()
            return
        }
        
        noCourseLabel.removeFromSuperview()
        populateList(with: courses)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let course = dataSource?.itemIdentifier(for: indexPath) {
            let detailsController = CourseDetailsController(rootView: CourseDetailsView(course: course))
            navigationController?.pushViewController(detailsController, animated: true)
        }
    }
    
    private func showNoCoursesLabel() {
        noCourseLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left: 80, bottom: 0, right: 60))
    }
    
    private func setupNavigationBar() {
        let addCourseNavigationItem = UIBarButtonItem(image: UIImage(systemName: Constants.Images.addCourse), style: .plain, target: self, action: #selector(handleAddCourse))
        addCourseNavigationItem.tintColor = Constants.Colors.mainGreen
        navigationItem.rightBarButtonItem = addCourseNavigationItem
    }
    
    @objc private func handleAddCourse() {
        let controller = AddCourseController(rootView: AddCourseView())
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
}

extension CoursesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
}
