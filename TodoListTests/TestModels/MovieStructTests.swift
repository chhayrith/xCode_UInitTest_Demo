//
//  MovieStructTests.swift
//  TodoListTests.
//
//  Created by liem on 11/1/23.
//

import XCTest
@testable import TodoList

final class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_MovieWithTitle(){
        let testMovie = Movie(title: "Spider Man")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Spider Man")
    }
    
    func testInit_SetMovieTitleAndReleaseDate(){
        let testMovie = Movie(title: "Spider Man", releaseDate: "1988")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1988")
    }
    
    func testEquatable_ReturnTrue(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testNotEquatable_ReturnTrue(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action/Drama")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEqautable_ReturnNotEqualForDifferentReleaseDate(){
        let actionMovie1 = Movie(title:"Action", releaseDate: "1999")
        let actionMovie2 = Movie(title:"Action", releaseDate: "1899")
        
        XCTAssertNotEqual(actionMovie1.releaseDate, actionMovie2.releaseDate)
    }
}
