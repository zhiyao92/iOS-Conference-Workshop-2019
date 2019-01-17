//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var project: Project!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.number)"
        Logger.log("Showed project \(project.number).")

        let detail = DetailView(project: project, view: self.view.frame)
        view = detail.loadView()
        detail.loadProject()
        detail.showProject = readProject
    }

    @objc func readProject() {
        guard let readVC = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as? ReadViewController else {
            return
        }

        readVC.project = project
        navigationController?.pushViewController(readVC, animated: true)
    }
}
