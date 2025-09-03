//
//  EmptyState.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit

public struct EmptyState {
    public var image: UIImage?
    public var title: String?
    public var message: String?
    public var buttonTitle: String?
    public var buttonAction: (() -> Void)?

    public init(
        image: UIImage? = nil,
        title: String? = nil,
        message: String? = nil,
        buttonTitle: String? = nil,
        buttonAction: (() -> Void)? = nil
    ) {
        self.image = image
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }
}

