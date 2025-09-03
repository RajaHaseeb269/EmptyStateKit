//
//  Untitled.swift
//  EmptyStateKit
//
//  Created by Muhammad Haseeb ur Rehman on 02.09.25.
//

//import UIKit
//import EmptyStateKit
//
//final class FriendsTableViewController: UITableViewController {
//
//    private var friends: [String] = []
//
//    // One instance, kept forever
//    private lazy var emptyView: EmptyStateView = {
//        let v = EmptyStateView(config: EmptyState(
//            image: UIImage(systemName: "person.3"),
//            title: "No Friends Yet",
//            message: "Tap below to find people.",
//            buttonTitle: "Find Friends",
//            buttonAction: { [weak self] in
//                let ac = UIAlertController(title: "Button tapped",
//                                           message: "Implement your action here",
//                                           preferredStyle: .alert)
//                ac.addAction(UIAlertAction(title: "OK", style: .default))
//                self?.present(ac, animated: true)
//            }
//        ))
//        v.translatesAutoresizingMaskIntoConstraints = false
//        // make stack respect margins & resist squashing
//        v.setContentCompressionResistancePriority(.required, for: .vertical)
//        v.setContentHuggingPriority(.required, for: .vertical)
//        return v
//    }()
//
//    private var didPlaceEmptyViewOnce = false
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if let v = tableView.backgroundView as? EmptyStateView, v.frame.size != tableView.bounds.size {
//            UIView.performWithoutAnimation {
//                v.frame = tableView.bounds
//                v.layoutIfNeeded()
//            }
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Friends"
//        tabBarItem = UITabBarItem(title: "Friends",
//                                  image: UIImage(systemName: "person.3"),
//                                  selectedImage: UIImage(systemName: "person.3.fill"))
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
//        // Add & pin the empty view once
//        tableView.addSubview(emptyView)
//        NSLayoutConstraint.activate([
//            emptyView.centerXAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.centerXAnchor),
//            emptyView.centerYAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.centerYAnchor),
//
//            // keep reasonable width on small screens
//            emptyView.leadingAnchor.constraint(greaterThanOrEqualTo: tableView.layoutMarginsGuide.leadingAnchor),
//            emptyView.trailingAnchor.constraint(lessThanOrEqualTo: tableView.layoutMarginsGuide.trailingAnchor)
//        ])
//        emptyView.isHidden = true   // start hidden
//
//        refresh()                   // load your data
//    }
//
// 
//
//    private func updateEmptyUI() {
//        let isEmpty = friends.isEmpty
//        UIView.performWithoutAnimation {
//            emptyView.isHidden = !isEmpty
//            tableView.separatorStyle = isEmpty ? .none : .singleLine
//            // ensure no pending layout animation
//            view.layoutIfNeeded()
//        }
//    }
//    
//    @objc private func showFindFriends() {
//        let ac = UIAlertController(
//            title: "Find Friends",
//            message: "Implement your action here (push a screen, start a search, etc.)",
//            preferredStyle: .alert
//        )
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
//    }
//
//    private func refresh() {
//        friends = []        // or your fetched data
//        tableView.reloadData()
//        tableView.updateEmptyStateIfNeeded(
//            isEmpty: friends.isEmpty,
//            state: EmptyState(
//                image: UIImage(systemName: "person.3"),
//                title: "No Friends Yet",
//                message: "Tap below to find people.",
//                buttonTitle: "Find Friends",
//                buttonAction: { [weak self] in self?.showFindFriends() }
//            )
//        )
//    }
//
//
//    // … your table data source here …
//}



import UIKit
import EmptyStateKit

final class FriendsTableViewController: UITableViewController {

    // MARK: - State
    private var friends: [String] = []
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        tabBarItem = UITabBarItem(title: "Friends",
                                  image: UIImage(systemName: "person.3"),
                                  selectedImage: UIImage(systemName: "person.3.fill"))

        // Safe if the cell is not created in storyboard
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        refresh()
    }

    // MARK: - Empty UI
    private func updateEmptyUI() {
        let isEmpty = friends.isEmpty
        tableView.updateEmptyStateIfNeeded(
            isEmpty: isEmpty,
            state: EmptyState(
                image: UIImage(systemName: "person.3"),
                title: "No Friends Yet",
                message: "Tap below to find people.",
                buttonTitle: "Find Friends",
                buttonAction: { [weak self] in
                    self?.showFindFriends()
                }
            )
        )
    }

    private func showFindFriends() {
        let ac = UIAlertController(title: "Button tapped",
                                   message: "Implement your action here",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    // MARK: - Sample data refresh
    private func refresh() {
        // Simulate “empty” (put mock names here to test non-empty)
        friends = []
        tableView.reloadData()
        updateEmptyUI()
    }

    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = friends[indexPath.row]
        return cell
    }
}
