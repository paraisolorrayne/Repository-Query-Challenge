//
//  APIManager.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation
import Alamofire

struct APIError: Codable {
    let message: String
    let documentation_url: String
//    {
//       "message": "API rate limit exceeded for xxx.xxx.xxx.xxx. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)",
//       "documentation_url": "https://developer.github.com/v3/#rate-limiting"
//    }
}
struct APIManager {
    
    static var manager: Alamofire.Session!
    
    /// GET FROM API
    ///
    /// - Parameters:
    ///   - url: URL API
    ///   - method: methods
    ///   - parameters: parameters
    ///   - encoding: encoding
    ///   - headers: headers
    ///   - completion: completion
    ///   - failure: failure
    static func request(_ url: String, method: HTTPMethod, parameters: Parameters, encoding: ParameterEncoding, headers: HTTPHeaders, completion: @escaping (_ response: Data) ->(), failure: @escaping (_ error: String, _ errorCode: Int) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        
        manager = Alamofire.Session(configuration: configuration)
        
        let apiURL = "https://api.github.com/" + url
        print("-- URL API: \(apiURL), \n\n-- headers: \(headers), \n\n-- Parameters: \(parameters)")
        print(apiURL)
        manager.request(
            apiURL,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers).responseString(
                queue: DispatchQueue.main,
                encoding: String.Encoding.utf8) { response in
                    
                    print("--\n \n CALLBACK RESPONSE: \(response)")
                    
                    if response.response?.statusCode == 200 {
                        guard let callback = response.data else {
                            failure(self.generateRandomError(), 0)
                            return
                        }
                        completion(callback)
                        
                    } else if response.response?.statusCode == 401 {
                        // add function automatically logout app
                    } else {
                        guard let callbackError = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(
                                APIError.self, from: callbackError)
                            failure(decoded.message, 0)
                        } catch _ {
                            failure(APIManager.generateRandomError(), 0)
                        }
                    }
                    
        }
        
    }
    
    /// GENERATE RANDOM ERROR
    ///
    /// - Returns: string error randoms
    static func generateRandomError() -> String {
        return "Oops. There is an error. Please reload."
    }
    
}
