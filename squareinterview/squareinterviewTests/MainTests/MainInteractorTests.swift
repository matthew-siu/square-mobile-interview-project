//
//  MainInteractorTests.swift
//  squareinterview
//
//  Created by Matthew Siu on 8/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import squareinterview
import XCTest

class MainInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: MainInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupMainInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainInteractor()
    {
        sut = MainInteractor(request: .init())
    }
    
    // MARK: Test doubles
    
    class MainPresentationLogicSpy: MainPresentationLogic
    {
        func displayInitialState(model: GetEmployeesAPIResponse, errorMsg: String?) {
            
        }
        
//        var presentSomethingCalled = false
//
//        func presentSomething(response: Main.Something.Response)
//        {
//            presentSomethingCalled = true
//        }
    }
    
    // MARK: Tests
    
//    func testDoSomething()
//    {
//        // Given
//        let spy = MainPresentationLogicSpy()
//        sut.presenter = spy
//        let request = Main.Something.Request()
//
//        // When
//        sut.doSomething(request: request)
//
//        // Then
//        XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
//    }
}
