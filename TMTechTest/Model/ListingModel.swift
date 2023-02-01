//
//  ListingModel.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 2/02/23.
//

import Foundation

enum ReserveState: Int {
	case none = 0
	case met = 1
	case notMet = 2
	case na = 3

	func title() -> String {
		switch self {
		case .notMet:
			return "Reserve not met"
		case .met:
			return "Reserve met"
		case .none, .na:
			return ""
		}
	}
}

/// Listing Model, this could also easily be a database model object
public class ListingModel: Identifiable {
	
	let json: [String: Any]
	init(json: [String: Any]) {
		self.json = json
	}
}

