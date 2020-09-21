//
//  HomeView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var viewModel = HomeViewModel()
	
	var body: some View {
		vstackMode
	}
	
	var vstackMode: some View {
		VStack {
			content
			.navigationBarTitle(viewModel.state.modeTitle(), displayMode: .inline)
			.navigationBarItems(trailing: modeButton)
		}
	}
	
	var content: some View {
		Group {
			switch viewModel.state {
			case .list:
				BuildingListView(viewModel: viewModel.listViewModel)
			case .map:
				Text("Map coming soon!")
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
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
