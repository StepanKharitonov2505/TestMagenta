//
//  UIColor+Extension.swift
//  TestMagenta
//
//  Created by Степан Харитонов on 14.03.2023.
//
import UIKit

public extension UIColor {
    static let defaultScreenBackgroundColor = UIColor.rgb(7, 24, 34)
    static let tabBarBackgroundColor = UIColor.rgb(27, 50, 55)
    static let tabBarSelectedColor = UIColor.rgb(221, 200, 169)
    static let tabBarUnselectedColor = UIColor.rgb(108, 125, 118)
}

public extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.rgba(r, g, b, 1.0)
    }
    static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
