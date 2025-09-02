//
//  PhotosCollectionViewController.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

import UIKit
import EmptyStateKit

final class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) { super.init(coder: coder) }

    private var photos: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        refresh()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tabBarItem = UITabBarItem(
            title: "Photos",
            image: UIImage(systemName: "photo.on.rectangle"),
            selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill")
        )
    }
    private func refresh() {
        photos = [] // simulate empty
        collectionView.reloadData()
        collectionView.updateEmptyStateIfNeeded(
            isEmpty: photos.isEmpty,
            state: EmptyState(
                image: UIImage(systemName: "photo.on.rectangle.angled"),
                title: "No Photos",
                message: "Add or import photos to see them here."
            )
        )
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { photos.count }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = .tertiarySystemFill
        cell.layer.cornerRadius = 12
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (collectionView.bounds.width - 12 * 3) / 2
        return CGSize(width: floor(w), height: 120)
    }
}
