
//
//  UXApplication+Mac.swift
//  
//
//  Created by Ben Gottlieb on 6/19/20.
//

#if os(OSX)
import AppKit
import Cocoa

public typealias UXApplication = NSApplication

public extension NSApplication {
    static var app: NSApplication { NSApp }
}

#endif
