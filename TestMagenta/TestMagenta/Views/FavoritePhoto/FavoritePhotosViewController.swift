//
//  FavoritePhotosViewController.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit

class FavoritePhotosViewController: BaseViewController {
    
    // MARK: Properties
    private var dataOnRealm: [StructureFavoriteJSON] = []
    private var loadDataMethods = RealmMethods()
    
    override func dataSetup() {
        self.dataOnRealm = self.loadDataMethods.loadImageArray()
    }
}

// MARK: Collection Data Source
extension FavoritePhotosViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataOnRealm.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsStroke.randomPhotoReuseId, for: indexPath) as? CollectionsPhotoCell else { return UICollectionViewCell() }
        
        let element = dataOnRealm[indexPath.item]
        cell.viewForLikeButton.isHidden = true
        cell.likeButton.isHidden = true
        cell.imageView.sd_imageTransition = .fade(duration: 0.3)
        cell.imageView.image = UIImage(data: element.data)

        return cell
    }
}
