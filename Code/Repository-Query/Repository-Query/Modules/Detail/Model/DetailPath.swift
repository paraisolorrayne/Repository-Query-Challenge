//
//  DetailPath.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 08/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation

struct DetailPath: Codable {
    
    let link_self: String?
    let git: String?
    let html: String?
    
    enum CodingKeys: String, CodingKey {
        case link_self = "self"
        case git = "git"
        case html = "html"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        link_self = try values.decodeIfPresent(String.self, forKey: .link_self)
        git = try values.decodeIfPresent(String.self, forKey: .git)
        html = try values.decodeIfPresent(String.self, forKey: .html)
    }
    
}
