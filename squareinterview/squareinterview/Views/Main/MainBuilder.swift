//
//  MainBuilder.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MainBuilder
{
    
    // - Storyboard
    private static let _storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
    
    // - Creator
    class func createScene(request: BuildRequest) -> MainViewController
    {
        let viewController = _storyboard.instantiateViewController(ofType: MainViewController.self)
        let interactor = MainInteractor(request: request)
        let presenter = MainPresenter()
        let router = MainRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}

/*
    MARK: - Scene building raw materials
    - All params inject here
*/
extension MainBuilder {
    struct BuildRequest {

    }
}
