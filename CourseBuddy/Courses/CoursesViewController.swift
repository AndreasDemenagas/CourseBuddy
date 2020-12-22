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
        collectionView.backgroundColor = .white
        collectionView.addSubview(noCourseLabel)
        //noCourseLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left: 80, bottom: 0, right: 60))
        
        setupCollectionView()
        fetchCourses()
    }
    
    fileprivate func setupCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Course> { (cell, indexPath, course) in
            var content = cell.defaultContentConfiguration()
            content.text = course.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Course>(collectionView: collectionView) { (collectionView, indexPath, circuit) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: circuit)
        }
    }
    
    func populateList(with circuits: [Course]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Course>()
        snapshot.appendSections([.main])
        snapshot.appendItems(circuits)
        dataSource?.apply(snapshot)
    }
    
    private func fetchCourses() {
        let courses = CoreDataManager.shared.fetchCompanies()
        populateList(with: courses)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCourses()
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
