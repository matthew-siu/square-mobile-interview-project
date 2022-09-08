//
//  MainWorkerTests.swift
//  squareinterview
//
//  Created by Matthew Siu on 8/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import squareinterview
import XCTest

class MainWorkerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: MainWorker!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupMainWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainWorker()
    {
        sut = MainWorker()
    }
    
    // MARK: Test doubles
    
    // MARK: Tests
    
//    func testSomething()
//    {
//        // Given
//
//        // When
//
//        // Then
//    }
}
