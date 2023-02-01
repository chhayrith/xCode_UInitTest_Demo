//
//  HomeViewContollerTests.swift
//  TodoListTests
//
//  Created by liem on 12/1/23.
//

import XCTest
@testable import TodoList

final class HomeViewContollerTests: XCTestCase {

    var sut: HomeViewController!
    
    override func setUpWithError() throws {
        sut = HomeViewController()
        _ = sut.view
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testHomeControllerVC_TableViewShouldNotNil(){
        XCTAssertNotNil(sut.tableView)
    }
    
    func testDataSource_ViewDidLoad_SetsTablmeViewDataSource(){
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is MovieLibraryDataService)
    }

    func testDataSource_ViewDidLoad_SetsTableViewDelegate(){
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is MovieLibraryDataService)
    }
    
    func testDataService_ViewDidLoad_SignleDataServiceObject(){
        XCTAssertEqual(sut.tableView.dataSource as! MovieLibraryDataService, sut.tableView.delegate as! MovieLibraryDataService)
    }
}
