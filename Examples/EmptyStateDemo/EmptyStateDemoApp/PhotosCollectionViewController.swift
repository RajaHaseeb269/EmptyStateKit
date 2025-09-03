//
//  PhotosCollectionViewController.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

//import UIKit
//import EmptyStateKit
//
//final class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    init() {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 12
//        layout.minimumInteritemSpacing = 12
//        super.init(collectionViewLayout: layout)
//    }
//
//    required init?(coder: NSCoder) { super.init(coder: coder) }
//
//    private var photos: [UIImage] = []
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if let v = collectionView.backgroundView as? EmptyStateView, v.frame.size != collectionView.bounds.size {
//            UIView.performWithoutAnimation {
//                v.frame = collectionView.bounds
//                v.layoutIfNeeded()
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = .systemBackground
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        refresh()
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        tabBarItem = UITabBarItem(
//            title: "Photos",
//            image: UIImage(systemName: "photo.on.rectangle"),
//            selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill")
//        )
//    }
//    private func refresh() {
//        photos = [] // simulate empty
//        collectionView.reloadData()
//        collectionView.updateEmptyStateIfNeeded(
//            isEmpty: photos.isEmpty,
//            state: EmptyState(
//                image: UIImage(systemName: "photo.on.rectangle.angled"),
//                title: "No Photos",
//                message: "Add or import photos to see them here."
//            )
//        )
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { photos.count }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.contentView.backgroundColor = .tertiarySystemFill
//        cell.layer.cornerRadius = 12
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let w = (collectionView.bounds.width - 12 * 3) / 2
//        return CGSize(width: floor(w), height: 120)
//    }
//}


import UIKit
import EmptyStateKit

final class PhotosCollectionViewController: UICollectionViewController,
                                            UICollectionViewDelegateFlowLayout {

    // MARK: - State
    private var photos: [UIImage] = []

    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        tabBarItem = UITabBarItem(title: "Photos",
                                  image: UIImage(systemName: "photo"),
                                  selectedImage: UIImage(systemName: "photo.fill"))

        // Safe if the cell is not created in storyboard
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        refresh()
    }

    // MARK: - Empty UI
    private func updateEmptyUI() {
        let isEmpty = photos.isEmpty
        collectionView.updateEmptyStateIfNeeded(
            isEmpty: isEmpty,
            state: EmptyState(
                image: UIImage(systemName: "photo"),
                title: "No Photos",
                message: "Add or import photos to see them here.",
                buttonTitle: nil,
                buttonAction: nil
            )
        )
    }

    // MARK: - Sample data refresh
    private func refresh() {
        // Simulate “empty” (add images to test non-empty)
        photos = []
        collectionView.reloadData()
        updateEmptyUI()
    }

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        // Minimal thumbnail cell (only used if you add photos to test)
        let tag = 999
        let iv: UIImageView
        if let existing = cell.contentView.viewWithTag(tag) as? UIImageView {
            iv = existing
        } else {
            iv = UIImageView(frame: cell.contentView.bounds)
            iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.tag = tag
            cell.contentView.addSubview(iv)
        }
        iv.image = photos[indexPath.item]
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.bounds.width - 3 * 8) / 2   // 2 columns, 8pt gaps
        return CGSize(width: side, height: side)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat { 8 }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 8 }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
