//
//  UXApplication+iOS.swift
//  
//
//  Created by Ben Gottlieb on 6/19/20.
//

#if canImport(UIKit)
import UIKit

public typealias UXApplication = UIApplication

public extension UIApplication {
    static var app: UIApplication { shared }
}

#endif
