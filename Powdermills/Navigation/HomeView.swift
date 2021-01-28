//
//  HomeView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
	@ObservedObject var viewModel = HomeViewModel()
	
	@State var showTermsAndConditions = false
	
	@State var uploadedBuildings = false
	
	var body: some View {
		VStack {
			headerView
			if viewModel.state == .list {
				vstackMode
			} else {
				ParkMapView(viewModel: viewModel.listViewModel)
					.navigationBarTitle("Map", displayMode: .inline)
			}
		}
	}
	
	var headerView: some View {
		ZStack {
			Color.titleBackgroundColor
				.edgesIgnoringSafeArea(.all)
				Text("POWDERMILLS")
					.font(Font.custom("BebasNeue Bold", size: 30))
					.foregroundColor(.titleTextColor)
			HStack {
				modeButton
					.padding()
					.frame(alignment: .leading)
				Spacer()
			}
			
		}.frame(height: 48, alignment: .center)
		
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
			Image(viewModel.state.buttonImage())
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
	
	var uploadBuildingsButton: some View {
			Button("Upload all buildings") {
				uploadedBuildings = true
				BuildingUploader.sharedInstance.addJSONBuildingsToFirestore()
			}.disabled(uploadedBuildings)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
