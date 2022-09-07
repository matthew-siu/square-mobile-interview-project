//
//  Repository.swift
//
//  Created by Matthew Siu on 24/8/2022.
//

import Foundation

// MARK: - Repository protocol
public protocol Repository {
    
    // Type define
    associatedtype ResponseType: Codable
    
    // HTTP Method
    var method: APIMethod { get }
    
    // Domain
    var baseURL: String { get }
    
    // Path
    var path: String? { get }
    
    // Header
    var headers: [String: Any] { get }
    
    // Body
    var body: [String: Any] { get }
    
    // Full URL Path
    var urlPath: String { get }
    
    var timeoutStamp: Double { get }

}

// MARK: - Prevent importing alamofire in every repository
public enum APIMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum APIResult<Value> {
    case success(Value)
    case failure(APIError)
}

public enum APIError: Hashable {
    
    // Connection error: there is issue in channel between client and server
    case error(reason: String)
}
