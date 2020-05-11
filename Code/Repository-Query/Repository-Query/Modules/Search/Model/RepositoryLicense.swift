//
//  RepositoryLicense.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 07/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation

struct RepositoryLicense: Codable {

        let key : String?
        let name : String?
        let nodeId : String?
        let spdxId : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case key = "key"
                case name = "name"
                case nodeId = "node_id"
                case spdxId = "spdx_id"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                key = try values.decodeIfPresent(String.self, forKey: .key)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
                spdxId = try values.decodeIfPresent(String.self, forKey: .spdxId)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
