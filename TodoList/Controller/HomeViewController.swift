//
//  ViewController.swift
//  Todo List
//
//  Created by liem on 11/1/23. 
//

import UIKit

class HomeViewController: UIViewController {

    let service = MovieLibraryDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        tableView.dataSource = service
        tableView.delegate = service
        tableView.register(MovieTableCell.self, forCellReuseIdentifier: MovieTableCell.identifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: view.bounds.width / 2.5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
        ])
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()

}

