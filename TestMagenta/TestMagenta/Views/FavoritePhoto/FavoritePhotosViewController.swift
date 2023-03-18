//
//  FavoritePhotosViewController.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit

class FavoritePhotosViewController: BaseViewController {

    // MARK: Properties
    private var dataOnRealm: [UIImage?] = [] {
        didSet {
            DispatchQueue.main.async {
                self.customView.collectionView.reloadData()
            }
        }
    }
    private var loadDataMethods = RealmMethods()
    private var imageFileDirectoryMethod = ImageInFileDirectory()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.activityIndicator.startAnimating()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadDataMethods.loadImageArray { item in
           DispatchQueue.main.async {
               self.customView.activityIndicator.stopAnimating()
           }
            self.dataOnRealm = item
        }
    }
}

// MARK: Collection Data Source
extension FavoritePhotosViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataOnRealm.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsStroke.randomPhotoReuseId,
            for: indexPath) as? CollectionsPhotoCell else {
            return UICollectionViewCell() }
        let element = dataOnRealm[indexPath.item]
        cell.likeButton.isHidden = true
        cell.imageView.image = element

        return cell
    }
}
