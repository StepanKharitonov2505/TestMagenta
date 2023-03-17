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
    let viewForLikeButton = UIView()
    let likeButton = UIButton()
    var url: URL?
    var callTapButton: ((URL) -> Void)?
    
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
        self.configureViewForLikeButton()
        self.configureImageView()
        self.configureButton()
        self.setupConstraint()
    }
    
    func addChild() {
        self.contentView.addSubview(imageView)
        self.imageView.addSubview(viewForLikeButton)
        self.viewForLikeButton.addSubview(likeButton)
    }
    
    private func configureButton() {
        self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        self.likeButton.imageView?.contentMode = .scaleAspectFill
        self.likeButton.tintColor = UIColor.gray
        self.likeButton.addTarget(self, action: #selector(addFavoritePhoto), for: .touchUpInside)
    }
    
    private func configureImageView() {
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = ConstantsNumeric.cornerRadiusImageView
        self.imageView.backgroundColor = .lightGray.withAlphaComponent(0.1)
    }
    
    private func configureViewForLikeButton() {
        self.viewForLikeButton.backgroundColor = UIColor.defaultScreenBackgroundColor
        self.viewForLikeButton.layer.cornerRadius = ConstantsNumeric.cornerRadiusImageView
        self.viewForLikeButton.layer.masksToBounds = true
    }
    
    func setupConstraint() {
        self.imageView.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.top.equalTo(self.contentView.snp.top)
        }
        
        self.viewForLikeButton.snp.makeConstraints { make in
            make.height.equalTo(self.imageView.snp.height).multipliedBy(0.15)
            make.width.equalTo(self.imageView.snp.width).multipliedBy(0.25)
            make.bottom.equalTo(self.imageView.snp.bottom).offset(-5)
            make.trailing.equalTo(self.imageView.snp.trailing).offset(-5)
        }
        
        self.likeButton.snp.makeConstraints { make in
            make.directionalMargins.equalTo(self.viewForLikeButton.snp.directionalMargins)
        }
    }
    
    @objc private func addFavoritePhoto() {
        guard let unwrapUrl = self.url else { return }
        self.callTapButton!(unwrapUrl)
    }
}
