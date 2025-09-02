//
//  UICollectionView+EmptyState.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

import UIKit

public extension UICollectionView {
    func setEmptyState(_ state: EmptyState?) {
        // Code to handle empty state
    }

    func updateEmptyStateIfNeeded(isEmpty: Bool, state: EmptyState) {
        setEmptyState(isEmpty ? state : nil)
    }
}


