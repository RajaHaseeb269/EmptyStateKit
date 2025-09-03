//
//  EmptyStateView.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 03.09.25.
//

import UIKit

final class EmptyStateView: UIView {
    private let stack = UIStackView()

    init(config: EmptyState) {
        super.init(frame: .zero)
        setup(config)
    }
    required init?(coder: NSCoder) { nil }

    private func setup(_ config: EmptyState) {
        backgroundColor = .clear

        let imageView = config.image.map { img -> UIImageView in
            let iv = UIImageView(image: img)
            iv.contentMode = .scaleAspectFit
            iv.tintColor = .tertiaryLabel
            return iv
        }

        let title = UILabel()
        title.text = config.title
        title.font = .preferredFont(forTextStyle: .headline)
        title.textAlignment = .center

        let msg = UILabel()
        msg.text = config.message
        msg.font = .preferredFont(forTextStyle: .subheadline)
        msg.textColor = .secondaryLabel
        msg.numberOfLines = 0
        msg.textAlignment = .center

        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8

        if let iv = imageView { stack.addArrangedSubview(iv) }
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(msg)

        if let title = config.buttonTitle {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            if let action = config.buttonAction {
                button.addAction(UIAction { _ in action() }, for: .touchUpInside)
            }
            stack.addArrangedSubview(button)
        }

        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
}
