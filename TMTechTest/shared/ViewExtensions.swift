//
//  ViewExtensions.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import Foundation
import SwiftUI

public extension View {
	
	/// Simple alert
	/// - Parameters:
	///   - isPresented: boolean used to control showing alert
	///   - title: title of the alert
	///   - message: detail message for the aller
	///   - dismissButton: custom dismiss button text (defaults to OK)
	/// - Returns: an alert that can be displayed
	func alert(isPresented: Binding<Bool>,  title: String, message: String? = nil, dismissButton: Alert.Button? = nil) -> some View {
		alert(isPresented: isPresented) {
			Alert(title: Text(title), message: {
				if let message = message {
					return Text(message)
				}
				else {
					return nil
				}
			}(), dismissButton: dismissButton)
		}
	}
}
