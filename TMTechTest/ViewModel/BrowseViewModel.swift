//
//  BrowseViewModel.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import Foundation
import Combine
import SwiftUI


public class BrowseViewModel: NSObject, ObservableObject {
	
	@Published var listings: [ListingModel] = [] 
	
	private var cancellable: AnyCancellable?
	
	private let listingService: ListingService

	init(listingService: ListingService = ListingService()) {
		self.listingService = listingService
		super.init()
		Task {
			// start an async task on create to fetch the listings
			await refreshListings()
		}
	}
	
	/// Retrieve latest listings. This could be called from a pull-to-refresh feature in the future.
	private func refreshListings() async {
		do {
			let tempListings = try await listingService.getLatestListings()
			
			// Update published listings on main thread.
			DispatchQueue.main.async { [weak self] in
				self?.listings = tempListings
			}
		}
		catch {
			// TODO: we need to notify an error occurred.
			// Once option might be to add another published property to notify interested UI when an error occurs.
			print(error)
		}
	}
}


/// Definition of properties and methods required to access a listing
public protocol ListingAccessProtocol {
	var region: String? { get }
	var title: String? { get }
	var displayPrice: String? { get }
	var buyNowPrice: String? { get }
	var reserveStatusTitle: String { get }
	var firstImageURL: URL? { get }
}

// Implements the model to view conversions strings here could be translated
extension ListingModel: ListingAccessProtocol {
	public var firstImageURL: URL? {
		if let photos = json["PhotoUrls"] as? [String],
		   let first = photos.first {
			return URL(string: first)
		}
		return nil
	}
	
	public var region: String? {
		json["Region"] as? String
	}
	
	public var title: String? {
		json["Title"] as? String
	}
	
	public var displayPrice: String? {
		if let isBuyNowOnly = json["IsBuyNowOnly"] as? Bool, isBuyNowOnly {
			return nil
		}
		return json["PriceDisplay"] as? String
	}
	
	public var buyNowPrice: String? {
		if let isBuyNow = json["HasBuyNow"] as? Bool, isBuyNow {
			// TODO: Format correctly using common number formatter for a prices.
			if let price = json["BuyNowPrice"] as? Int {
				return String(format: "$%.2f", Double(price))
			}
		}
		return nil
	}
	
	public var reserveStatusTitle: String {
		let reserveState = json["ReserveState"] as? Int
		if let state = ReserveState(rawValue: reserveState ?? ReserveState.na.rawValue) {
			return state.title()
		}
		return  ReserveState.na.title()
	}
	
}
