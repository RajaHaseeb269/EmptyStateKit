//
//  UICollectionView+EmptyState.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit
@MainActor
public extension UICollectionView {
    func setEmptyState(_ state: EmptyState?) {
        if let state {
            backgroundView = EmptyStateView(config: state)
        } else {
            backgroundView = nil
        }
    }

    func updateEmptyStateIfNeeded(isEmpty: Bool, state: EmptyState) {
        setEmptyState(isEmpty ? state : nil)
    }
}
