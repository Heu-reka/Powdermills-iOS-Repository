//
//  HomeView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
	
	/// The home view model
	@ObservedObject var viewModel = HomeViewModel()
	
	/// Flag to stop mulitple uploads of buildings. Only used when app is in upload mode
	@State var uploadedBuildings = false
	
	var body: some View {
		VStack {
			headerView
			if viewModel.state == .list {
				buildingListView
			} else {
				ParkMapView(buildingListViewModel: viewModel.listViewModel)
					.navigationBarTitle("Map", displayMode: .inline)
			}
		}.onAppear {
			viewModel.listViewModel.loadData()
		}
	}
	
	var headerView: some View {
		ZStack {
			Color.titleBackgroundColor
				.edgesIgnoringSafeArea(.all)
			Text("POWDERMILLS")
				.font(Font.homeScreenTitleFont)
				.foregroundColor(.titleTextColor)
			HStack {
				modeButton
					.padding()
					.frame(alignment: .leading)
				Spacer()
			}
			
		}
		.frame(height: 48, alignment: .center)
	}
	
	var buildingListView: some View {
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
			Image(viewModel.state.buttonImage())
		}
	}
	
	/// Only used in upload mode
	var uploadBuildingsButton: some View {
		Button("Upload all buildings") {
			uploadedBuildings = true
			FirestoreController.sharedInstance.addJSONBuildingsToFirestore()
		}
		.disabled(uploadedBuildings)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
