//
//  MainModels.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Models will go here
// Defines request, response and corresponding view models
enum Main
{
    struct ViewModel {
        let cells: [Cell]
        var errMsg: String? = nil
        
        struct Cell{
            let photoPath: String?
            let name: String
            let team: String
        }
    }
}
