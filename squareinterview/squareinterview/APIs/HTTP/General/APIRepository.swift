//
//  APIRepository.swift
//
//  Created by Matthew Siu on 26/8/2022.
//  Copyright © 2022 ecobee. All rights reserved.
//

import Foundation

class APIRepository<Response: Codable>: Repository {
    

    public typealias ResponseType = Response
    
    // Dependent properties
    public let request: Codable
    
    public var method: APIMethod {
        return .post
    }
    
    public var baseURL: String {
        return Configs.apiDomain
    }
    
    public var path: String? {
        return nil
    }
    
    public var headers: [String: Any] {
        let headers: [String: Any] = [:]
        return headers
    }
    
    public var body: [String: Any] {
        return self.request.dictionary
    }
    
    public var allowNil: Bool {
        return true
    }
    
    public var allowReroute: Bool {
        return false
    }
    
    public var urlPath: String {
        var urlPath = self.baseURL
        if let path = self.path {
            urlPath += path
        }
        return urlPath
    }
    
    public var timeoutStamp: Double{
        return 15
    }
    
    public init(request: Codable) {
        self.request = request
    }
}

extension Encodable {
    var dictionary: [String: Any] {
        let encoder = JSONEncoder()
        
        // encodable to json data / also know as json object
        guard let data = try? encoder.encode(self) else { return [:] }
        
        // json data to dictionary
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return [:] }
        
        return jsonDictionary
    }
}
