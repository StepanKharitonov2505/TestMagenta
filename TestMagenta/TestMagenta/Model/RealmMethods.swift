//
//  RealmMethods.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 16.03.2023.
//

import Foundation
import RealmSwift

final class RealmMethods {
    func saveFavoriteImageData(url: String) {
            do {
                let object = StructureFavoriteJSON(url: url)
                Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: false)
                let realm = try Realm()
                realm.beginWrite()
                realm.add(object, update: .modified)
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }
    
    func loadImageArray() -> [UIImage?] {
        do {
            let realm = try Realm()
            let imageData = Array(realm.objects(StructureFavoriteJSON.self))
            let imageDataArrayFromFileSystem = imageData
                .map {
                    ImageInFileDirectory().getImage(url: $0.url)
                }
            return imageDataArrayFromFileSystem
        } catch {
            print(error)
            return []
        }
    }
    
    // MARK: TestMethod
    func deleteAllData() {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.deleteAll()
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
}
