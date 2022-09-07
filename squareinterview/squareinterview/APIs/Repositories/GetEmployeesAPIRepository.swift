//
//  GetEmployeesAPIRepository.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//

import Foundation
import PromiseKit

class GetEmployeesAPIRepository: APIRepository<GetEmployeesAPIResponse>{
    
    override var path: String?{
        return "employees.json"
    }
    
    override var method: APIMethod{
        return .get
    }
    
    init() {
        super.init(request: GetEmployeesAPIRequest())
    }
}

struct GetEmployeesAPIRequest: Codable{
    
}

struct GetEmployeesAPIResponse: Codable{
    
    var employees: [Employee]
    
    struct Employee: Codable{
        let uuid: String
        let full_name: String
        let phone_number: String?
        let email_address: String
        let biography: String?
        let photo_url_small: String?
        let photo_url_large: String?
        let team: String
        let employee_type: String
    }
    
    enum EmployeeType: String, Codable{
        case FULL_TIME
        case PART_TIME
        case CONTRACTOR
    }
    
}

extension APIManager{
    static func getEmployeesAPIRepository() -> Promise<GetEmployeesAPIResponse>{
        return Promise { promise in
            HttpRequest.send(repo: GetEmployeesAPIRepository())
                .done{body in
                    promise.fulfill(body)
                }.catch{error in
                    promise.reject(error)
                }
        }
        
    }
}
