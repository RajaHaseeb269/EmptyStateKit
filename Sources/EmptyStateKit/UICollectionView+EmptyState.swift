//
//  UICollectionView+EmptyState.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit

public extension UICollectionView {

    /// Shows or hides the empty state view on a collection view.
    func setEmptyState(_ state: EmptyState?) {
        if let state = state {
            let v = EmptyStateView(config: state)
            v.frame = bounds
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            UIView.performWithoutAnimation { backgroundView = v }
        } else {
            UIView.performWithoutAnimation { backgroundView = nil }
        }
    }

    /// Helper: toggles the empty state based on your data being empty or not.
    func updateEmptyStateIfNeeded(isEmpty: Bool, state: EmptyState) {
        setEmptyState(isEmpty ? state : nil)
    }
}



