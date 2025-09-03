//
//  UITableView+EmptyState.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit
import ObjectiveC.runtime

private enum _ESKAssocKeys { static var prevSeparatorKey: UInt8 = 0 }

public extension UITableView {
    func setEmptyState(_ state: EmptyState?) {
        if let state = state {
            let v = EmptyStateView(config: state)
            v.frame = bounds
            v.autoresizingMask = [.flexibleWidth, .flexibleHeight]   // <- important
            UIView.performWithoutAnimation {
                backgroundView = v
                objc_setAssociatedObject(self, &_ESKAssocKeys.prevSeparatorKey,
                                         separatorStyle.rawValue,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                separatorStyle = .none
            }
        } else {
            UIView.performWithoutAnimation {
                backgroundView = nil
                if let raw = objc_getAssociatedObject(self, &_ESKAssocKeys.prevSeparatorKey) as? Int,
                   let prev = UITableViewCell.SeparatorStyle(rawValue: raw) {
                    separatorStyle = prev
                }
            }
        }
    }

    func updateEmptyStateIfNeeded(isEmpty: Bool, state: EmptyState) {
        setEmptyState(isEmpty ? state : nil)
    }
}



