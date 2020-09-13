//
//  HomeView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI

struct HomeView: View {
	var viewModel = HomeViewModel()
	
	var body: some View {
		NavigationView {
			switch viewModel.state {
			case .list:
				BuildingListView(viewModel: viewModel.listViewModel)
			case .map:
				Text("Map coming soon!")
			}
		}.navigationBarItems(trailing: modeButton)
	}
	
	var modeButton: some View {
		Button(action: {
			viewModel.state.toggle()
		}) {
			Image(systemName: viewModel.state.buttonImage())
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
