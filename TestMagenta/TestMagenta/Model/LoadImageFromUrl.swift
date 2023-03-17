//
//  ImageDataFromService.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import Foundation
import RealmSwift

final class LoadImageFromUrl {
    
    func getImage(pageNumber: Int, completion: @escaping([StructureJSON]) -> Void ) {
        guard let url = URL(string: ConstantsStroke.loadPhotosUrl+"?page=\(pageNumber)") else { return }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            session.dataTask(with: url) { (data, response, error) in
                guard let jsonData = data else { return }
                do {
                    let imageData = try JSONDecoder().decode([StructureJSON].self, from: jsonData)
                    completion(imageData)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}
