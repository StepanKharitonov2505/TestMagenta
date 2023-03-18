//
//  StructureFavoriteJSON.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import Foundation
import RealmSwift

class StructureFavoriteJSON: Object {
    @Persisted var imageName: String
    @Persisted var url: String

    convenience init(imageName: String, url: String) {
        self.init()
        self.imageName = imageName
        self.url = url
    }

    override static func primaryKey() -> String? {
        return "url"
    }
}
