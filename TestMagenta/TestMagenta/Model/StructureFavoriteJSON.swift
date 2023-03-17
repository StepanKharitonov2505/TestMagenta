//
//  StructureFavoriteJSON.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import Foundation
import RealmSwift

class StructureFavoriteJSON: Object {
    @Persisted var url: String
    @Persisted var data: Data
    
    convenience init(url: String, data: Data) {
        self.init()
        self.url = url
        self.data = data
    }
    
    override static func primaryKey() -> String? {
        return "url"
    }
}
