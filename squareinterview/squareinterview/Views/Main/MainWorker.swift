//
//  MainWorker.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import PromiseKit

class MainWorker
{
    static func getEmployees() -> Promise<GetEmployeesAPIResponse>{
        return APIManager.getEmployeesAPIRepository()
//        return APIManager.getEmptyEmployeeAPIRepository()
//        return APIManager.getMalFormedEmployeeAPIRepository()
    }
}
