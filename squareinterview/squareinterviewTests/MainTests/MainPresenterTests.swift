//
//  MainPresenterTests.swift
//  squareinterview
//
//  Created by Matthew Siu on 8/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import squareinterview
import XCTest

class MainPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: MainPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupMainPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainPresenter()
    {
        sut = MainPresenter()
    }
    
    // MARK: Test doubles
    
    class MainDisplayLogicSpy: MainDisplayLogic
    {
        func displayInitialState(vm: Main.ViewModel) {
            
        }
        
//        var displaySomethingCalled = false
//
//        func displaySomething(viewModel: Main.Something.ViewModel)
//        {
//            displaySomethingCalled = true
//        }
    }
    
    // MARK: Tests
    
//    func testPresentSomething()
//    {
//        // Given
//        let spy = MainDisplayLogicSpy()
//        sut.viewController = spy
//        let response = Main.Something.Response()
//
//        // When
//        sut.presentSomething(response: response)
//
//        // Then
//        XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
//    }
}
