//
//  MainRouter.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - The main interface to be called by others
protocol MainRoutingLogic
{
    
}

// MARK: - The possible elements that can be
protocol MainDataPassing
{
    var dataStore: MainDataStore? { get }
}

// MARK: - Main router body
class MainRouter: NSObject, MainRoutingLogic, MainDataPassing
{
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
}

// MARK: - Routing and datapassing for one nav action
extension MainRouter {

}
