//  
//  SearchModel.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation

struct SearchModel: Codable {
    let incompleteResults : Bool?
    let items : [RepositoryItem]?
    let totalCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case items = "items"
        case totalCount = "total_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        incompleteResults = try values.decodeIfPresent(Bool.self, forKey: .incompleteResults)
        items = try values.decodeIfPresent([RepositoryItem].self, forKey: .items)
        totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
    }

}
