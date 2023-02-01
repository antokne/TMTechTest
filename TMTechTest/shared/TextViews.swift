//
//  TextViews.swift
//  TMTechTest
//
//  Created by Antony Gardiner on 1/02/23.
//

import SwiftUI

struct TextTitleView: View {
	var title: String
    var body: some View {
		Text(title)
			// colours and fonts should go into a "Theme" type struct and handle light/dark mode.
			// Can also change system styled fonts to use a specific font type and allow for Dynamic type to work.
			.font(Font.body.bold())
			.foregroundColor(Color(hex: 0x393531))
    }
}

struct TextSubTitleView: View {
	var subTitle: String
	var body: some View {
		Text(subTitle)
			.font(Font.caption)
			.foregroundColor(Color(hex: 0x85807b))
	}
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
		TextTitleView(title: "iPhone 8 Plus silver")
		TextSubTitleView(subTitle: "Auckland")
    }
}


