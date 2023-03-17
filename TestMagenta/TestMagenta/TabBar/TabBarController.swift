//
//  TabBarController.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let dataSource: [TabBarItem] = [
            .randomPhoto,
            .favoritePhoto
        ]
        
        self.viewControllers = dataSource.map {
            switch $0 {
            case .randomPhoto:
                return RandomPhotoViewController()
            case .favoritePhoto:
                return FavoritePhotosViewController()
            }
        }
        
        self.viewControllers?.enumerated().forEach{
            $1.tabBarItem.title = dataSource[$0].title.uppercased()
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].imageName)
        }
        
        let width = tabBar.bounds.width
        let substrateLayer = createTabBarLayer()
        self.tabBar.layer.insertSublayer(substrateLayer, at: 0)
        self.tabBar.itemWidth = width / 2
        self.tabBar.itemPositioning = .centered
        self.tabBar.tintColor = UIColor.tabBarSelectedColor
        self.tabBar.unselectedItemTintColor = UIColor.tabBarUnselectedColor
        
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = UIColor.clear
    }
    
    private func createTabBarLayer() -> CAShapeLayer {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let height = self.tabBar.bounds.height + positionOnY*2
        let width = self.tabBar.bounds.width - positionOnX*2
        
        lazy var layer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height),
            cornerRadius: height/2)
        
        layer.path = bezierPath.cgPath
        layer.fillColor = UIColor.tabBarBackgroundColor.cgColor
        return layer
    }

}
