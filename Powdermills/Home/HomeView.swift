//
//  HomeView.swift
//  Powdermills
//
//  Created by James Sadlier on 30/08/2020.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		VStack(alignment: .center, spacing: 0) {
			HomeButtonView(type: .exploreMills) {
				print("exploreMills")
			}
			HomeButtonView(type: .makeGunpowder) {
				print("makeGunpowder")
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
