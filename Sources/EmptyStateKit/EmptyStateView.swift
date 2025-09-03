//
//  EmptyStateView.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit

public final class EmptyStateView: UIView {
    private let stack = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let button = UIButton(type: .system)

    public init(config: EmptyState) {
        super.init(frame: .zero)
        setup()
        apply(config: config)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public func apply(config: EmptyState) {
        imageView.image = config.image
        titleLabel.text = config.title
        messageLabel.text = config.message
        if let t = config.buttonTitle {
            button.setTitle(t, for: .normal)
            button.isHidden = false
        } else {
            button.isHidden = true
        }
        // replace previous action
        button.removeTarget(nil, action: nil, for: .allEvents)
        if let action = config.buttonAction {
            button.addAction(UIAction { _ in action() }, for: .touchUpInside)
        }
    }

    private func setup() {
        backgroundColor = .clear

        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        imageView.tintColor = .secondaryLabel
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .center

        messageLabel.font = .preferredFont(forTextStyle: .subheadline)
        messageLabel.textColor = .secondaryLabel
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center

        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(messageLabel)
        stack.addArrangedSubview(button)

        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
}

