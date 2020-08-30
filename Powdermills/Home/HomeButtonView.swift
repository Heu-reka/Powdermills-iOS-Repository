//
//  HomeButtonView.swift
//  Powdermills
//
//  Created by James Sadlier on 30/08/2020.
//

import SwiftUI
import Combine

enum HomeButtonType {
	case exploreMills
	case makeGunpowder
	
	func title() -> String {
		switch self {
		case .exploreMills:
			return "Discover the Powdermills"
		case .makeGunpowder:
			return "Make the Gunpowder"
		}
	}
	
	func subtitle() -> String {
		switch self {
		case .exploreMills:
			return "Take a virtual tour of Ballincolligs Powdermills"
		case .makeGunpowder:
			return "Create your own avatar and help us to\ncreate some gunpowder"
		}
	}
	
	func imageName() -> String {
		switch self {
		case .exploreMills:
			return "discoverMills"
		case .makeGunpowder:
			return "makeGunpowder"
		}
	}
	
	func textColor() -> Color {
		switch self {
		case .exploreMills:
			return .primaryGreen
		case .makeGunpowder:
			return .primaryText
		}
	}
	
	func backgroundColor() -> Color {
		switch self {
		case .exploreMills:
			return .primaryText
		case .makeGunpowder:
			return .primaryGreen
		}
	}
}

struct HomeButtonView: View {
	
	var textColor: Color
	var backgroundColor: Color
	var title: String
	var subtitle: String
	var imageName: String
	var type: HomeButtonType
	
	var action: () -> ()
	
	init(type: HomeButtonType, action: @escaping () -> ()) {
		self.type = type
		self.textColor = type.textColor()
		self.backgroundColor = type.backgroundColor()
		self.title = type.title()
		self.subtitle = type.subtitle()
		self.imageName = type.imageName()
		self.action = action
	}
	
	var body: some View {
		ZStack {
			backgroundColor
				.edgesIgnoringSafeArea([.bottom, .top])
			VStack {
				Button(action: {
					action()
				}) {
					Image(imageName)
						.resizable()
						.aspectRatio(contentMode: .fit)
				}
				VStack(alignment: .leading) {
					Text(title)
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.title)
						.foregroundColor(textColor)
					Text(subtitle)
						.foregroundColor(textColor)
				}
				.padding(.horizontal, 40)
				.padding(.bottom)
			}
		}.frame(maxWidth: .infinity)
	}
}

struct HomeButtonView_Previews: PreviewProvider {
	static var previews: some View {
		HomeButtonView(type: .exploreMills, action: {
			
		})
	}
}
