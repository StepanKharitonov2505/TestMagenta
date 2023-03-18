//
//  ViewController.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit
import SDWebImage

class RandomPhotoViewController: BaseViewController {

    // MARK: Properties
    private var loadDataMethods = LoadImageFromUrl()
    private var imageDataArray: [StructureJSON] = [] {
        didSet {
            DispatchQueue.main.async {
                self.customView.collectionView.reloadData()
            }
        }
    }
    private var pageNumber: Int = 1
    
    // MARK: Functions
    override func dataSetup() {
        loadDataMethods.getImage(pageNumber: pageNumber) {[weak self] imageDataArray in
            guard let self = self else { return }
            self.imageDataArray = imageDataArray
        }
    }
    
    private func loadMoreData() {
        self.pageNumber += 1
        self.loadDataMethods.getImage(pageNumber: self.pageNumber) {[weak self] imageDataArray in
                guard let self = self else { return }
                self.imageDataArray.append(contentsOf: imageDataArray)
            }
        }
}

// MARK: Collection Data Source
extension RandomPhotoViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDataArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsStroke.randomPhotoReuseId, for: indexPath) as? CollectionsPhotoCell else { return UICollectionViewCell() }
        let element = imageDataArray[indexPath.row]
        let url = URL(string: element.downloadUrl)
        cell.imageView.sd_imageTransition = .fade(duration: 0.3)
        cell.imageView.sd_setImage(with: url)
        cell.likeButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.isUserInteractionEnabled = true
        return cell
    }
    
    @objc func tapButton(sender: UIButton) {
        let element = imageDataArray[sender.tag]
        let replaceName = element.downloadUrl
            .replacingOccurrences(of: "/", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ":", with: "")
        guard let url =  URL(string: element.downloadUrl) else { return }
        DispatchQueue.global(qos: .utility).async {
            if let data = try? Data(contentsOf: url) {
                ImageInFileDirectory().saveImage(url: replaceName, data: data)
                RealmMethods().saveFavoriteImageData(imageName: replaceName, url: element.downloadUrl)
            }
        }
    }
}

// MARK: Collection Delegate
extension RandomPhotoViewController {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.item == imageDataArray.count - 10 {
                loadMoreData()
            }
        }
}

