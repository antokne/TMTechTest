//
//  ContentView.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import SwiftUI

// TODO: Move this to view model or somewhere sensible.
enum TMTabViews: Int {
	case discover = 0
	case watchlist = 1
	case myTradeMe = 2
	
	var title: String {
		switch self {
		case .discover:
			return "Browse"
		case .watchlist:
			return "Watchlist"
		case .myTradeMe:
			return "My Trade Me"
		}
	}
}

struct ContentView: View {
	@State var selection = TMTabViews.discover	// A sensible default
	
	@State private var isAlertSearchShowing = false /// bool for showing temp search alert
	@State private var isAlertCartShowing = false	/// bool for showing temp cart alert
	
    var body: some View {
		NavigationStack {
			TabView(selection: $selection) {
				BrowseView()
					.tag(TMTabViews.discover)
					.tabItem {
						Label(TMTabViews.discover.title, image: "search")
					}
				WatchlistView()
					.tag(TMTabViews.watchlist)
					.tabItem {
						Label(TMTabViews.watchlist.title, image: "watchlist")
					}
				MyTradeMeView()
					.tag(TMTabViews.myTradeMe)
					.tabItem {
						Label(TMTabViews.myTradeMe.title, image: "profile-16")
					}
			}
			.navigationTitle(selection.title)
			.toolbar {
				Button(action: {
					// TODO: TICKET-1234 - add search view here
					isAlertSearchShowing.toggle()
				}) {
					Image("search")
				}
				.alert(isPresented: $isAlertSearchShowing, title: "Search view goes here.")
				Button(action: {
					// TODO: TICKET-1234 - add cart view here
					isAlertCartShowing.toggle()
				}) {
					Image("cart")
				}
				.alert(isPresented: $isAlertCartShowing, title: "Cart view goes here")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
