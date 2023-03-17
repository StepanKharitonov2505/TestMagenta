//
//  StructureJSON.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import Foundation

class StructureJSON: Codable {
    let id: String
    let url: String
    let download_url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case download_url
      }
      func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(id, forKey: .id)
        try container.encode(url, forKey: .url)
        try container.encode(download_url, forKey: .download_url)
      }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        url = try container.decode(String.self, forKey: .url)
        download_url = try container.decode(String.self, forKey: .download_url)
      }
}
