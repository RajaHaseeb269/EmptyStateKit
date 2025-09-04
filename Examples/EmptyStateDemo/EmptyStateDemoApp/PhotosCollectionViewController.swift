//
//  PhotosCollectionViewController.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

import UIKit
import EmptyStateKit

final class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // Data
    private var photos: [UIImage] = [] { didSet { collectionView.reloadData(); updateEmptyUI() } }

    // Layout knobs
    private let cellID = "Cell"
    private let columns = 2
    private let spacing: CGFloat = 8
    private let inset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.contentInsetAdjustmentBehavior = .never
        if let flow = collectionViewLayout as? UICollectionViewFlowLayout {
            flow.minimumLineSpacing = spacing
            flow.minimumInteritemSpacing = spacing
            flow.sectionInset = inset
        }

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        refresh()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let b = view.safeAreaInsets.bottom
        if collectionView.contentInset.bottom != b {
            collectionView.contentInset.bottom = b
            var vsi = collectionView.verticalScrollIndicatorInsets
            vsi.bottom = view.safeAreaInsets.bottom
            collectionView.verticalScrollIndicatorInsets = vsi

        }
    }

    // Empty state
    private func updateEmptyUI() {
        collectionView.updateEmptyStateIfNeeded(
            isEmpty: photos.isEmpty,
            state: EmptyState(
                image: UIImage(systemName: "photo"),
                title: "No Photos",
                message: "Add or import photos to see them here."
            )
        )
    }

    // Demo data
    private func refresh() { photos = [] }

    // Data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        let tag = 999
        let iv: UIImageView = (cell.contentView.viewWithTag(tag) as? UIImageView) ?? {
            let v = UIImageView(frame: cell.contentView.bounds)
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            v.contentMode = .scaleAspectFill
            v.clipsToBounds = true
            v.tag = tag
            cell.contentView.addSubview(v)
            return v
        }()
        iv.image = photos[indexPath.item]
        return cell
    }

    // Layout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cols = CGFloat(columns)
        let available = collectionView.bounds.width - inset.left - inset.right - spacing * (cols - 1)
        let side = floor(available / cols)
        return CGSize(width: side, height: side)
    }
}

