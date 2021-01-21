//
//  HomeView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var viewModel = HomeViewModel()
	
	@State var showTermsAndConditions = false
	
	var body: some View {
		if viewModel.state == .list {
			vstackMode
		} else {
			ParkMapView()
				.navigationBarTitle("Map", displayMode: .inline)
		}
	}
	
	var vstackMode: some View {
		VStack {
			BuildingListView(viewModel: viewModel.listViewModel)
				.navigationBarTitle(viewModel.state.modeTitle(), displayMode: .inline)
				.navigationBarItems(trailing: modeButton)
		}
	}
	
	var backgroundImage: some View {
		ZStack {
			Image("background")
				.resizable()
				.aspectRatio(contentMode: .fill)
			if viewModel.state == .list {
				Rectangle()
					.foregroundColor(.listItemBackgroundColor)
					.opacity(0.5)
			}
		}
	}
	
	var modeButton: some View {
		Button(action: {
			viewModel.objectWillChange.send()
			viewModel.state.toggle()
		}) {
			Image(systemName: viewModel.state.buttonImage())
		}
	}
	
	var termsAndConditionButton: some View {
		Button(action: {
			self.showTermsAndConditions = true
		}) {
			Image(systemName: "scroll")
		}.fullScreenCover(isPresented: self.$showTermsAndConditions, content: {
			TermsAndConditionsView()
		})
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
