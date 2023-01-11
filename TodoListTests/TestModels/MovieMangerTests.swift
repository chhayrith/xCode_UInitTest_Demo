//
//  MovieMangerTests.swift
//  TodoListTests
//
//  Created by liem on 11/1/23.
//

@testable import TodoList
import XCTest

final class MovieMangerTests: XCTestCase {
    var sut = MovieManger()
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testsInit_MoviesToSee_ReturnZero() {
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnZero() {
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & See
    
    func testAdd_MoviesToSee_ReturnsOne(){
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex(){
        sut.addMovie(movie: arthouseMovie)
        
        let movieQueied = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie.title, movieQueied.title)
    }

    // MARK: Check Off
    func testCheckOffMovie_UpdatesMovieManagerCounts(){
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    // MARK: clearing & Reseting
    func testClearArrays_ReturnArrayCountOfZero(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    // MARK: Duplicates
    
    func testDuplicateMovies_ShouldNotBeAddedToArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
