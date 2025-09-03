//
//  Untitled.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

import UIKit
import EmptyStateKit

final class FriendsTableViewController: UITableViewController {
    private var friends: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Friends"
        tabBarItem.image = UIImage(systemName: "person.3")
        title = "Friends"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        refresh()
    }

    private func refresh() {
        friends = [] // simulate empty
        tableView.reloadData()
        tableView.updateEmptyStateIfNeeded(
            isEmpty: friends.isEmpty,
            state: EmptyState(
                image: UIImage(systemName: "person.3"),
                title: "No Friends Yet",
                message: "Tap below to find people.",
                buttonTitle: "Find Friends",
                buttonAction: { [weak self] in
                    let ac = UIAlertController(title: "Action", message: "Button tapped", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac, animated: true)
                }
            )
        )
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { friends.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var cfg = cell.defaultContentConfiguration()
        cfg.text = friends[indexPath.row]
        cell.contentConfiguration = cfg
        return cell
    }
}
