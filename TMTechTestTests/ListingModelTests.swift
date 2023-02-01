//
//  ListingModelTests.swift
//  TMTechTestTests
//
//  Created by Antony Gardiner on 2/02/23.
//

import XCTest
@testable import TMTechTest

final class ListingModelTests: XCTestCase {
	
	var json: [String: Any]?

    override func setUpWithError() throws {
		guard let file = Bundle(for: ListingModelTests.self).url(forResource: "one-listing", withExtension: "json"),
		   let data = try? Data(contentsOf: file) else {
			XCTFail("json not found")
			return
		}
		
		json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
		XCTAssertNotNil(json)
	}

    override func tearDownWithError() throws {
    }

    func testListingModel() throws {

		guard let json else {
			XCTFail("json is nil")
			return
		}
		
		let listing = ListingModel(json: json)
		XCTAssertNotNil(listing)
		XCTAssertEqual(listing.title, "Auction 503 Buckland Rd")
		XCTAssertEqual(listing.firstImageURL?.absoluteString, "https://images.tmsandbox.co.nz/photoserver/thumb/15721010.jpg")
		XCTAssertEqual(listing.region, "Waikato")
		XCTAssertEqual(listing.displayPrice, "To be auctioned")

    }
}
