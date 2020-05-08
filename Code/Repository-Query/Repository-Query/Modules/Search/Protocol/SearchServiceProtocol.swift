//  
//  SearchServiceProtocol.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation

protocol SearchServiceProtocol {

    /// SAMPLE FUNCTION -* Please rename this function to your real function
    ///
    /// - Parameters:
    ///   - success: -- success closure response, add your Model on this closure.
    ///                 example: success(_ data: YourModelName) -> ()
    ///   - failure: -- failure closure response, add your Model on this closure.  
    ///                 example: success(_ data: APIError) -> ()
    func fetchRepositoryBy(languageName: String, success: @escaping(_ data: SearchModel) -> (), failure: @escaping() -> ())

}
