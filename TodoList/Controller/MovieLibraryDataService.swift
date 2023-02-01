//
//  MovieLibraryDataService.swift
//  TodoList
//
//  Created by liem on 12/1/23.
//

import UIKit

enum LibrarySection:Int{
    case movieToSee, movieSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManger?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LibrarySection(rawValue: section) == .movieToSee ? movieManager?.moviesToSeeCount ?? 0 :  movieManager?.moviesSeenCount ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.identifier, for: indexPath) as! MovieTableCell
        return cell
    }
    

}
