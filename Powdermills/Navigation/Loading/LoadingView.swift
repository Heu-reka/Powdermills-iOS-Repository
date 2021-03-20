//
//  LoadingView.swift
//  Powdermills
//
//  Created by James Sadlier on 15/03/2021.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct LoadingView: View {
	
	var body: some View {
		ZStack {
			Image("croppedmill")
				.resizable()
				.aspectRatio(contentMode: ContentMode.fill)
			
			Color.loadingTint
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				Text("POWDERMILLS")
					.font(Font.loadingScreenTitleFont)
					.foregroundColor(Color.white)
					.padding(.bottom, 40)
				
				spinner()
					.padding()
			}
		}
	}
	
	func spinner() -> AnyView {
		if let bundleURL = Bundle.main.url(forResource: "loading", withExtension: "gif") {
			return AnyView(
				WebImage(url: bundleURL, isAnimating: .constant(true))
					.resizable()
					.aspectRatio(contentMode: ContentMode.fit)
					.frame(width: 244, height: 244, alignment: .center)
			)
		}
		return AnyView(EmptyView())
	}
}

struct LoadingView_Previews: PreviewProvider {
	static var previews: some View {
		LoadingView()
	}
}
