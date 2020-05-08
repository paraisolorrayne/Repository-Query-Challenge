//  
//  SearchService.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation
import Alamofire

class SearchService: SearchServiceProtocol {
    // Call protocol function

    func fetchRepositoryBy(languageName: String, success: @escaping(_ data: SearchModel) -> (), failure: @escaping() -> ()) {

        let url = "search/repositories"

        let parameters: Parameters = [
            "q": "language",
            "language": "\(languageName)",
            "sort": "stars",
            "order": "desc",
            "page": "1",
            "per_page": "1"
        ]
        
        APIManager.request(
            url,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding(destination: .queryString),
            headers: [:],
            completion: { data in
                
                // mapping data
                do {
                    print(data)
                    let decoded = try JSONDecoder().decode(SearchModel.self, from: data)
                    success(decoded)
                } catch _ {
                    failure()
                }
                
        }) { errorMsg, errorCode in
            failure()
        }

    }

}
