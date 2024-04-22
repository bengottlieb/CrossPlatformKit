//
//  UXImage+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

#if os(OSX)
import AppKit
import Cocoa

public typealias UXImage = NSImage

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, *)
extension Image {
	public init(uxImage: UXImage) {
		self.init(nsImage: uxImage)
	}
}
#endif

extension NSImage {
	public convenience init?(data: Data?) {
		guard let data else { return nil }
		
		self.init(data: data)
	}
	
	public convenience init?(url: URL?) {
		guard let url else { return nil }
		
		self.init(contentsOf: url)
	}
	
	public convenience init(cgImage: CGImage) {
		let size = CGSize(width: cgImage.width, height: cgImage.height)
		self.init(cgImage: cgImage, size: size)
	}
	
	public func jpegData(compressionQuality quality: CGFloat = 0.9) -> Data? {
		guard let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return nil }
		let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
		let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [NSBitmapImageRep.PropertyKey.compressionFactor: quality])
		return jpegData
	}
	
	public func pngData() -> Data? {
		guard let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return nil }
		let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
		let pngData = bitmapRep.representation(using: NSBitmapImageRep.FileType.png, properties: [:])
		return pngData
	}
	
	static public func create(size: CGSize, drawing: (CGContext) -> Void) -> UXImage? {
		let image = NSImage(size: size)
		image.lockFocus()
		if let ctx = CGContext.current {
			drawing(ctx)
		} else {
			print("⚠️ CGContext.current Failed")
		}
		image.unlockFocus()
		return image
	}

//	public func create(size: CGSize, bitsPerComponent: Int, bytesPerRow: Int, colorspace: CGColorSpace? = nil, data: UnsafeMutableRawPointer) -> UXImage? {
//		return nil
//	}
}

#endif
