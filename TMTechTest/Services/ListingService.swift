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
	
	private let tradeMeApi: TradeMeAPI
		
	/// Default constructor
	/// - Parameter tradeMeApi: optional injected trademe api
	init(tradeMeApi: TradeMeAPI = TradeMeAPI.shared) {
		self.tradeMeApi = tradeMeApi
	}
	
	/// Get the latest listings
	/// - Returns: an array of listing models
	public func getLatestListings() async throws -> [ListingModel] {

		// Get cloud listings and convert to array of key-value pairs
		if let results = try await tradeMeApi.listings.getLastestListings() as? [[String: Any]] {

			// Normally here I might insert this data into a local model and then notify via a publisher
			// which the view model has subscribed to.
			let listings = results.map { ListingModel(json: $0) }
			return listings
		}
		return []
	}
}
