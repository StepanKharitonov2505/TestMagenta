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
    private var imageDataArray: [StructureJSON] = []
    private var pageNumber: Int = 1
    
    // MARK: Functions
    override func dataSetup() {
        loadDataMethods.getImage(pageNumber: pageNumber) {[weak self] imageDataArray in
            guard let self = self else { return }
            self.imageDataArray = imageDataArray
            DispatchQueue.main.async {
            self.customView.collectionView.reloadData()
            }
        }
    }
    
    private func loadMoreData() {
        self.pageNumber += 1
        self.loadDataMethods.getImage(pageNumber: self.pageNumber) {[weak self] imageDataArray in
                guard let self = self else { return }
                self.imageDataArray.append(contentsOf: imageDataArray)
                DispatchQueue.main.async {
                self.customView.collectionView.reloadData()
                }
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
        let element = imageDataArray[indexPath.item]
        let url = URL(string: element.download_url)
        cell.imageView.sd_imageTransition = .fade(duration: 0.3)
        cell.imageView.sd_setImage(with: url)
        cell.url = url
        cell.likeButton.isUserInteractionEnabled = true
        return cell
    }

}

// MARK: Collection Delegate
extension RandomPhotoViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionsPhotoCell else { return }
        cell.callTapButton = { item in
            if let data = try? Data(contentsOf: item) {
                RealmMethods().saveFavoriteImageData(url: item.absoluteString, data: data)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.item == imageDataArray.count - 10 {
                loadMoreData()
            }
        }
}

