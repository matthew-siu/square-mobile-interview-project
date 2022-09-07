//
//  squareinterviewTests.swift
//  squareinterviewTests
//
//  Created by Matthew Siu on 6/9/2022.
//

import XCTest
@testable import squareinterview

class squareinterviewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_GetEmployeesAPIRepository(){
        
        let expectation = self.expectation(description: "getEmployeesAPIRepository")
        APIManager.getEmployeesAPIRepository()
            .done{body in
                XCTAssertNotNil(body)
                XCTAssertGreaterThanOrEqual(body.employees.count, 0)
                expectation.fulfill()
            }.catch{error in
                XCTAssertNil(error)
            }
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_GetEmployeesAPIRepository_InvalidCheck_Empty(){
        
        let expectation = self.expectation(description: "getEmptyEmployeeAPIRepository")
        APIManager.getEmptyEmployeeAPIRepository()
            .done{body in
                XCTAssertNotNil(body)
                XCTAssertEqual(body.employees.count, 0)
                expectation.fulfill()
            }.catch{error in
                XCTAssertNil(error)
            }
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_GetEmployeesAPIRepository_InvalidCheck_InvalidFormat(){
        
        let expectation = self.expectation(description: "getMalFormedEmployeeAPIRepository")
        APIManager.getMalFormedEmployeeAPIRepository()
            .done{body in
                XCTAssertNil(body)
            }.catch{error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        self.waitForExpectations(timeout: 5, handler: nil)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
