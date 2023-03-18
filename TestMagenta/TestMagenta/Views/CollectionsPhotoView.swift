//
//  RandomPhotoView.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit
import SnapKit

class CollectionsPhotoView: UIView, StandardSetupView {
    
    let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    func configureUI() {
        self.collectionViewLayout.scrollDirection = .vertical
        self.collectionViewLayout.headerReferenceSize = .zero
        self.collectionViewLayout.footerReferenceSize = .zero
        self.collectionView.backgroundColor = UIColor.defaultScreenBackgroundColor
        self.addChild()
        setupConstraint()
    }
    
    func addChild() {
        self.addSubview(collectionView)
    }
    
    func setupConstraint() {
        self.collectionView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(self.snp.top)
        }
    }
}
