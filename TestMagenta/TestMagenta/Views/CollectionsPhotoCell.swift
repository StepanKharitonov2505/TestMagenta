//
//  PhotoCell.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit
import SnapKit

class CollectionsPhotoCell: UICollectionViewCell, StandardSetupView {

    let imageView = UIImageView()
    let likeButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    func configureUI() {
        self.backgroundColor = UIColor.clear
        self.addChild()
        self.configureImageView()
        self.configureButton()
        self.setupConstraint()
    }

    func addChild() {
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(likeButton)
    }

    private func configureButton() {
        self.likeButton.setImage(UIImage(systemName: ConstantsStroke.heartSystemImage), for: .normal)
        self.likeButton.imageView?.contentMode = .scaleAspectFill
        self.likeButton.tintColor = UIColor.heartButtonColor
        self.likeButton.backgroundColor = UIColor.tabBarBackgroundColor
        self.likeButton.layer.cornerRadius = ConstantsNumeric.cornerRadiusImageView
        self.likeButton.layer.masksToBounds = true
    }

    private func configureImageView() {
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = ConstantsNumeric.cornerRadiusImageView
        self.imageView.backgroundColor = .lightGray.withAlphaComponent(0.1)
    }

    func setupConstraint() {
        self.imageView.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.top.equalTo(self.contentView.snp.top)
        }

        self.likeButton.snp.makeConstraints { make in
            make.height.equalTo(self.imageView.snp.height).multipliedBy(0.15)
            make.width.equalTo(self.imageView.snp.width).multipliedBy(0.25)
            make.bottom.equalTo(self.imageView.snp.bottom).offset(-5)
            make.trailing.equalTo(self.imageView.snp.trailing).offset(-5)
        }
    }
}
