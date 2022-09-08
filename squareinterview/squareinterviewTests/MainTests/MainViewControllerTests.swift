//
//  MainViewControllerTests.swift
//  squareinterview
//
//  Created by Matthew Siu on 8/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import squareinterview
import XCTest

class MainViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: MainViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupMainViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "MainViewController", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class MainBusinessLogicSpy: MainBusinessLogic
    {
        var getEmployeeCalled = false
        
        
        func loadInitialState() {
            getEmployeeCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldFetchEmployeesWhenViewIsLoaded()
    {
        // Given
        let spy = MainBusinessLogicSpy()
        sut.interactor = spy

        // When
        loadView()

        // Then
        XCTAssertTrue(spy.getEmployeeCalled, "viewDidLoad() should ask the interactor to do something")
    }
    
//    func testDisplaySomething()
//    {
//        // Given
//        let viewModel = Main.Something.ViewModel()
//
//        // When
//        loadView()
//        sut.displaySomething(viewModel: viewModel)
//
//        // Then
//        //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
//    }
}
