//
//  ListingService.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 2/02/23.
//

import Foundation
import Combine
import TradeMeAPI

public class ListingService: NSObject, ObservableObject {
	
	/// Get the latest listings
	/// - Returns: an array of listing models
	public func getLatestListings() async throws -> [ListingModel] {

		// Get cloud listings and convert to array of key-value pairs
		if let results = try await TradeMeAPI().listings.getLastestListings() as? [[String: Any]] {

			// Normally I here I might insert this data into a local model and then notify via a publisher
			// which the view model has subscribed to.
			let listings = results.map { ListingModel(json: $0) }
			return listings
		}
		return []
	}
}
