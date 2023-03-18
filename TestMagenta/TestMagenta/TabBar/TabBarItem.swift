//
//  TabBarItem.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//

import Foundation

enum TabBarItem: Int {
    case randomPhoto
    case favoritePhoto
   
    var title: String {
        switch self {
        case .randomPhoto: return ConstantsStroke.randomPhotoScreenTabBarDescription
        case .favoritePhoto: return ConstantsStroke.favoritePhotoScreenTabBarDescription
        }
    }
    
    var imageName: String {
        switch self {
        case.randomPhoto: return ConstantsStroke.randomPhotoScreenTabBarItemImage
        case .favoritePhoto: return ConstantsStroke.heartSystemImage
        }
    }
    
}
