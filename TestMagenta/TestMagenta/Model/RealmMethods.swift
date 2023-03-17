//
//  RealmMethods.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 16.03.2023.
//

import Foundation
import RealmSwift

final class RealmMethods {
    func saveFavoriteImageData(url: String, data: Data) {
            do {
                let object = StructureFavoriteJSON(url: url, data: data)
                Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
                let realm = try Realm()
                realm.beginWrite()
                realm.add(object, update: .modified)
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }
    
    func loadImageArray() -> [StructureFavoriteJSON] {
        do {
            let realm = try Realm()
            let imageData = Array(realm.objects(StructureFavoriteJSON.self))
            return imageData
        } catch {
            print(error)
            return []
        }
    }
    
}
