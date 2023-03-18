//
//  FavoritePhotosViewController.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit

class FavoritePhotosViewController: BaseViewController {
    
    // MARK: Properties
    private var dataOnRealm: [UIImage?] = []
    private var loadDataMethods = RealmMethods()
    private var imageFileDirectoryMethod = ImageInFileDirectory()
    
    override func dataSetup() {
        self.dataOnRealm = self.loadDataMethods.loadImageArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataOnRealm = self.loadDataMethods.loadImageArray()
        self.customView.collectionView.reloadData()
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
        cell.likeButton.isHidden = true
        cell.imageView.image = element

        return cell
    }
}
