//
//  Untitled.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

import UIKit
import EmptyStateKit

final class FriendsTableViewController: UITableViewController {

    // IDs and title
    private let cellID = "Cell"
    
    private var friends: [String] = [] {
        didSet { tableView.reloadData(); updateEmptyUI() }
    }

    // Reuse one EmptyState with safe capture
    private lazy var emptyState: EmptyState = {
        EmptyState(
            image: UIImage(systemName: "person.3"),
            title: "No Friends Yet",
            message: "Tap below to find people.",
            buttonTitle: "Find Friends",
            buttonAction: { [weak self] in self?.showFindFriends() }
        )
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Friends"
        tabBarItem = UITabBarItem(
            title: "Friends",
            image: UIImage(systemName: "person.3"),
            selectedImage: UIImage(systemName: "person.3.fill")
        )

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.contentInsetAdjustmentBehavior = .never   // avoid first frame jump

        friends = []
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let b = view.safeAreaInsets.bottom
        if tableView.contentInset.bottom != b {
            tableView.contentInset.bottom = b
            //tableView.scrollIndicatorInsets.bottom = b
            var vsi = tableView.verticalScrollIndicatorInsets
            vsi.bottom = b
            tableView.verticalScrollIndicatorInsets = vsi
        }
    }

    // Empty state + separators
    private func updateEmptyUI() {
        let empty = friends.isEmpty
        tableView.separatorStyle = empty ? .none : .singleLine
        tableView.updateEmptyStateIfNeeded(isEmpty: empty, state: emptyState)
    }

    private func showFindFriends() {
        let ac = UIAlertController(title: "Button tapped", message: "Implement your action here", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    // UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { friends.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = friends[indexPath.row]
        return cell
    }
}

