//
//  ViewController.swift
//  HackingWithSwift
//
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var user = User()
    var dataSource = TableDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(showSettings))

        updatePreferences()
    }

    @objc func showSettings() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
            fatalError("Unable to find SettingsViewController")
        }

        vc.delegate = self
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }

    func updateUser(_ newUser: User) {
        user = newUser
        user.save()
        updatePreferences()
    }

    func updatePreferences() {
        title = user.name

        dataSource.filterData(number: user.showProjects)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = dataSource.showingProjects[indexPath.row]

        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }

        detailVC.project = project
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
