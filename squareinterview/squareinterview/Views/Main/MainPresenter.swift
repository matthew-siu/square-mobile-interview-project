//
//  MainPresenter.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Presentation logic goes here
protocol MainPresentationLogic
{
    func displayInitialState(model: GetEmployeesAPIResponse, errorMsg: String?)
}

// MARK: - Presenter main body
class MainPresenter: MainPresentationLogic
{
    weak var viewController: MainDisplayLogic?
    
}

// MARK: - Presentation receiver
extension MainPresenter {
    func displayInitialState(model: GetEmployeesAPIResponse, errorMsg: String? = nil){
        var cells: [Main.ViewModel.Cell] = model.employees.map{
            Main.ViewModel.Cell(photoPath: $0.photo_url_small, name: $0.full_name, team: $0.team)
        }
        cells = cells.sorted { cell1, cell2 in
            cell1.name < cell2.name
        }
        self.viewController?.displayInitialState(vm: .init(cells: cells, errMsg: errorMsg))
    }
}
