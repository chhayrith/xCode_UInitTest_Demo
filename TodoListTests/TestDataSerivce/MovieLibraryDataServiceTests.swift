//
//  MovieLibraryDataServiceTests.swift
//  TodoListTests
//
//  Created by liem on 12/1/23.
//

import XCTest
@testable import TodoList

final class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var tableView: UITableView!
    
    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "DarkComedy")
    
    override func setUpWithError() throws {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManger()
        
        tableView = UITableView()
        tableView.dataSource = sut
        tableView.register(MovieTableCell.self, forCellReuseIdentifier: MovieTableCell.identifier)
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testTableViewSections_Count_ReturnTwo(){
        
        XCTAssertEqual(tableView.numberOfSections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnMoviesToSeeCount(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: thriller)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnMoviesSeenCount(){
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: Cell
    func testCell_RowAtIndex_ReturnsMovieCell(){
        sut.movieManager?.addMovie(movie: darkComedy)
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is MovieTableCell)
    }
    
    
}


