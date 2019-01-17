//
//  TableDataSource.swift
//  HackingWithSwift
//
//  Created by Kelvin Tan on 1/17/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class TableDataSource: NSObject, UITableViewDataSource {
    var allProjects = [Project]()
    var showingProjects = [Project]()

    override init() {
        guard let url = Bundle.main.url(forResource: "projects", withExtension: "json") else {
            fatalError("Failed to locate projects.json in app bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load projects.json in app bundle.")
        }

        let decoder = JSONDecoder()

        guard let loadedProjects = try? decoder.decode([Project].self, from: data) else {
            fatalError("Failed to decode projects.json from app bundle.")
        }

        allProjects = loadedProjects
        showingProjects = allProjects
    }

    func filterData(number: Int) {
        if number == 0 {
            // show all projects
            showingProjects = allProjects
        } else {
            // show only the project types they selected
            showingProjects = allProjects.filter {
                $0.number % 3 == number - 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showingProjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = showingProjects[indexPath.row]
        cell.textLabel?.attributedText = project.makeAttributedString()
        return cell
    }
}
