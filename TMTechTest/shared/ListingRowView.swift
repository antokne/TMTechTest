//
//  ListingRowView.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import SwiftUI


struct ListingRowView: View {
	var listing: ListingModel
    var body: some View {
		HStack {
			AsyncImage(url: listing.firstImageURL) { image in
				image.resizable()
					.scaledToFill()
					.frame(width: 100, height: 100)
					.clipped()

			} placeholder: {
				Image("placeholder")
					.aspectRatio(contentMode: .fit)
					.frame(width: 100, height: 100)

			}
			VStack(alignment: .leading) {
				if let region = listing.region {
					TextSubTitleView(subTitle: region)
				}
				if let title = listing.title {
					TextTitleView(title: title)
				}
				Spacer()
				HStack {
					VStack(alignment: .leading) {
						if let price = listing.displayPrice {
							TextTitleView(title: price)
						}
						TextSubTitleView(subTitle: listing.reserveStatusTitle)
					}
					Spacer()
					VStack(alignment: .trailing) {
						if let buyNowPrice = listing.buyNowPrice {
							TextTitleView(title: buyNowPrice)
							TextSubTitleView(subTitle: "Buy now")

						}
						
					}
				}
			}
		}
		.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ListingRowView_Previews: PreviewProvider {
    static var previews: some View {
		List {
//			ListingRowView(listing: Listing(imageURL: URL(string: "https://picsum.photos/200"), title: "iPhone 8 Plus - in really pretty good condition", location: "Auckland", currentBid: "$450", status: "Reserve met"))
//			ListingRowView(listing: Listing(imageURL: URL(string: "https://images.tmsandbox.co.nz/photoserver/thumb/15721009.jpg"), title: "Naim amp", location: "Wellington", currentBid: "$1230", status: "Reserve not met"))
		}
    }
}
