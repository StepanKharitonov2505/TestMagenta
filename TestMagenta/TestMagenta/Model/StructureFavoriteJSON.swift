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
    
    convenience init(url: String) {
        self.init()
        self.url = url
    }
    
    override static func primaryKey() -> String? {
        return "url"
    }
}
