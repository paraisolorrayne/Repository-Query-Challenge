//  
//  DetailModel.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import Foundation

struct DetailModel: Codable {
    
    let name : String?
    let path : String?
    let sha : String?
    let size : Int?
    let url : String?
    let htmlUrl : String?
    let gitUrl : String?
    let downloadUrl : String?
    let type : String?
    let content : String?
    let encoding : String?
    let links : DetailPath?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case path = "path"
        case sha = "sha"
        case size = "size"
        case url = "url"
        case htmlUrl = "html_url"
        case gitUrl = "git_url"
        case downloadUrl = "download_url"
        case type = "type"
        case content = "content"
        case encoding = "encoding"
        case links = "_links"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        sha = try values.decodeIfPresent(String.self, forKey: .sha)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        gitUrl = try values.decodeIfPresent(String.self, forKey: .gitUrl)
        downloadUrl = try values.decodeIfPresent(String.self, forKey: .downloadUrl)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        encoding = try values.decodeIfPresent(String.self, forKey: .encoding)
        links = try DetailPath(from: decoder)
    }
    
}
