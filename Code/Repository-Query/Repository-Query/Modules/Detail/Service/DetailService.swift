//  
//  DetailService.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation
import Alamofire

class DetailService: DetailServiceProtocol {
    // Call protocol function

    func removeThisFuncName(success: @escaping(_ data: DetailModel) -> (), failure: @escaping() -> ()) {

        let url = ""

        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: [:],
            completion: { data in
                
                // mapping data
                do {
                    let decoded = try JSONDecoder().decode(DetailModel.self, from: data)
                    success(decoded)
                } catch _ {
                    failure()
                }
                
        }) { errorMsg, errorCode in
            failure()
        }

    }

}
