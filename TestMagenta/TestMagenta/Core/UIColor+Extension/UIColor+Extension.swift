//
//  UIColor+Extension.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//
import UIKit

public extension UIColor {
    static let defaultScreenBackgroundColor = UIColor.rgb(20, 20, 20)
    static let tabBarBackgroundColor = UIColor.rgb(30, 30, 30)
    static let tabBarSelectedColor = UIColor.rgb(255, 255, 255)
    static let tabBarUnselectedColor = UIColor.rgb(110, 110, 110)
    static let heartButtonColor = UIColor.rgb(130, 130, 130)
}

public extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.rgba(r, g, b, 1.0)
    }
    static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
