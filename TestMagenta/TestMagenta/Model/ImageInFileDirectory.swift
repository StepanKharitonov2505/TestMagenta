//
//  LoadImageInDirectory.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 18.03.2023.
//

import UIKit

final class ImageInFileDirectory {

    func saveImage(url: String, data: Data) {
        if let path = getPathForImage(url: url) {
            do {
                try data.write(to: path)
                print("success saving")
            } catch let error {
                print("error saving. \(error)")
            }
        }
    }

    func getImage(url: String) -> UIImage? {
        guard let path = getPathForImage(url: url)?.path(),
              FileManager.default.fileExists(atPath: path) else {
            print("error getting path.")
            return nil
        }
        print("success getting path")
        return UIImage(contentsOfFile: path)
    }
    
    private func getPathForImage(url: String) -> URL? {
        guard let path = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("\(url).jpeg") else {
            print("error getting path")
            return nil
        }
        return path
    }
}
