//
//  MainInteractor.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import PromiseKit

// MARK: - Requests from view
protocol MainBusinessLogic
{
    func loadInitialState()
}

// MARK: - Datas retain in interactor defines here
protocol MainDataStore
{
    
}

// MARK: - Interactor Body
class MainInteractor: MainBusinessLogic, MainDataStore
{
    // VIP Properties
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    
    // State
    
    
    // Init
    init(request: MainBuilder.BuildRequest) {
        
    }
}

// MARK: - Business
extension MainInteractor {
    func loadInitialState(){
        MainWorker.getEmployees()
            .done{body in
                self.presenter?.displayInitialState(model: body, errorMsg: nil)
            }.catch{error in
                self.presenter?.displayInitialState(model: GetEmployeesAPIResponse(employees: []), errorMsg: error.localizedDescription)
            }
    }
}
