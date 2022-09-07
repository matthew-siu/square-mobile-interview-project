//
//  GetMalFormedEmployeeAPIRepository.swift
//  squareinterview
//
//  Created by Matthew Siu on 7/9/2022.
//

import Foundation
import PromiseKit

class GetMalFormedEmployeeAPIRepository: APIRepository<GetEmployeesAPIResponse>{
    
    override var path: String?{
        return "employees_malformed.json"
    }
    
    override var method: APIMethod{
        return .get
    }
    
    init() {
        super.init(request: GetEmployeesAPIRequest())
    }
}

extension APIManager{
    static func getMalFormedEmployeeAPIRepository() -> Promise<GetEmployeesAPIResponse>{
        return Promise { promise in
            HttpRequest.send(repo: GetMalFormedEmployeeAPIRepository())
                .done{body in
                    promise.fulfill(body)
                }.catch{error in
                    promise.reject(error)
                }
        }
        
    }
}

