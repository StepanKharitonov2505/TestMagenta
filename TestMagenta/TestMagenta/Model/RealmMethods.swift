//
//  RealmMethods.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 16.03.2023.
//

import Foundation
import RealmSwift

final class RealmMethods {
    func saveFavoriteImageData(imageName: String, url: String) {
            do {
                let object = StructureFavoriteJSON(imageName: imageName, url: url)
                Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
                let realm = try Realm()
                realm.beginWrite()
                realm.add(object, update: .modified)
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }
    
    func loadImageArray(completion: @escaping(([UIImage?])-> Void)) {
        DispatchQueue.global(qos: .background).async {
            do {
                
                let realm = try Realm()
                let imageData = Array(realm.objects(StructureFavoriteJSON.self))
                let imageDataArrayFromFileSystem = imageData
                    .map {
                        ImageInFileDirectory().getImage(url: $0.imageName)
                    }
                completion(imageDataArrayFromFileSystem)
            } catch {
                print(error)
                return
            }
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
