//
//  ColorExtensions.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import Foundation
import SwiftUI

extension Color {
	
	/// Convience init method to contruct a color from hex value
	/// - Parameters:
	///   - hex: hex color to use
	///   - opacity: opacity to use
	init(hex: Int, opacity: Double = 1.0) {
		let red = Double((hex & 0xff0000) >> 16) / 255.0
		let green = Double((hex & 0xff00) >> 8) / 255.0
		let blue = Double((hex & 0xff) >> 0) / 255.0
		self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
	}
}
