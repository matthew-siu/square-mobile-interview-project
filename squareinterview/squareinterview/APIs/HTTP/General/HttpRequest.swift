//
//  HttpRequest.swift
//
//  Created by Matthew Siu on 24/8/2022.
//

import Foundation
import PromiseKit

class HttpRequest{
    
    static func send<R: Repository>(repo: R) -> Promise<R.ResponseType>{
        return Promise { promise in
            NSLog("\(repo.method): \(repo.urlPath)")
            if let url = URL(string: repo.urlPath){
                var request = URLRequest(url: url)
                switch repo.method{
                case .post:
                    do{
                        request.httpBody = try JSONSerialization.data(withJSONObject: repo.body, options: JSONSerialization.WritingOptions())
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    }catch let error{
                        NSLog("JSON Parse Error: \(error)")
                    }
                default:
                    break
                }
                
                request.httpMethod = repo.method.rawValue
                request.timeoutInterval = repo.timeoutStamp

                for (key, value) in repo.headers{
                    if let value = value as? String{
                        request.setValue(value, forHTTPHeaderField: key)
                    }
                }
                httpRequest(from: request, repo: repo) { (response) in
                    switch response{
                    case .success(let body):
                        print("fulfill")
                        promise.fulfill(body)
                    case .failure(let error):
                        switch error{
                        case .error(let reason):
                            print("error: \(reason)")
                            promise.reject(NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey: reason]))
                        }

                    }
                }
            }else{
                promise.reject(NSError(domain:"", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid url"]))
            }
        }
    }
    
    static func httpRequest<R: Repository>(from request: URLRequest, repo: R, completion: @escaping (APIResult<R.ResponseType>) -> Void){
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = request.timeoutInterval
        sessionConfig.timeoutIntervalForResource = request.timeoutInterval
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data{
                do{
                    let decoded = try JSONDecoder().decode(R.ResponseType.self, from: data)
                    completion(.success(decoded))
                }catch{
                    completion(.failure(.error(reason: error.localizedDescription)))
                }
            }else{
                completion(.failure(.error(reason: "no data")))
            }
        }
        task.resume()
    }
}
