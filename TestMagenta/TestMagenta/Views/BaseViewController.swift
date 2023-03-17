//
//  BaseViewController.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 16.03.2023.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: Properties
    var customView = CollectionsPhotoView()
    
    // MARK: LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.collectionView.register(CollectionsPhotoCell.self, forCellWithReuseIdentifier: ConstantsStroke.randomPhotoReuseId)
        self.customView.collectionView.delegate = self
        self.customView.collectionView.dataSource = self
        self.dataSetup()
    }
    
    func dataSetup() {
    }
}

extension BaseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: Collection Delegate Layout
extension BaseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width/2 - ConstantsNumeric.cellSizeCorrection
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let roundEdgeInset: CGFloat = ConstantsNumeric.edgeInsets
        let edgeInsets: UIEdgeInsets = UIEdgeInsets(
            top: roundEdgeInset,
            left: roundEdgeInset,
            bottom: roundEdgeInset,
            right: roundEdgeInset)
        return edgeInsets
    }
}
