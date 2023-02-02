//
//  BrowseView.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import SwiftUI

struct BrowseView: View {
	
	@StateObject private var browseViewModel: BrowseViewModel = BrowseViewModel()
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(browseViewModel.listings) { listing in
					NavigationLink(destination: ListingDetailView()) {
						ListingRowView(listing: listing)
					}
				}
			}
		}
	}
}

struct Discover_Previews: PreviewProvider {
	static var previews: some View {
		BrowseView()
	}
}
