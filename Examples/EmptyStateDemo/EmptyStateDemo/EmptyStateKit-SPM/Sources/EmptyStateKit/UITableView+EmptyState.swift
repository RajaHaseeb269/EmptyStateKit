//
//  UITableView+EmptyState.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit
import ObjectiveC.runtime
@MainActor
private var prevSeparatorKey: UInt8 = 0
@MainActor
public extension UITableView {
    func setEmptyState(_ state: EmptyState?) {
        if let state {
            let view = EmptyStateView(config: state)
            backgroundView = view
            objc_setAssociatedObject(self, &prevSeparatorKey, separatorStyle.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            separatorStyle = .none
        } else {
            backgroundView = nil
            if let raw = objc_getAssociatedObject(self, &prevSeparatorKey) as? Int,
               let prev = UITableViewCell.SeparatorStyle(rawValue: raw) {
                separatorStyle = prev
            }
        }
    }

    func updateEmptyStateIfNeeded(isEmpty: Bool, state: EmptyState) {
        setEmptyState(isEmpty ? state : nil)
    }
}
