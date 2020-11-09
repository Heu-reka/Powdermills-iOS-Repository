//
//  BuildingListView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI

struct BuildingListView: View {
	var viewModel = BuildingListViewModel()
	var body: some View {
		ScrollView(.vertical) {
			LazyVStack(alignment: .center, spacing: 20, content: {
				Spacer()
//				ForEach(viewModel.buildingViewModels) { viewModel in
//					BuildingListViewItem(viewModel: viewModel)
//				}
				ForEach(viewModel.buildings) { building in
					BuildingListViewItem(viewModel: BuildingListViewItemModel(building: building))
//					NavigationLink(
//						destination:
//							BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: building)),
//						label: {
//							BuildingRowView(building: building)
//						})
				}
			}).padding(.horizontal, 40)
		}
	}
}

struct BuildingListView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListView()
	}
}


struct BuildingListViewItem: View {
	var viewModel: BuildingListViewItemModel
	
	var body: some View {
		NavigationLink(
				destination:
					destination,
				label: {
					AnyView(label)
				}).onAppear(perform: {
					print("onAppear NavigationLink \(viewModel.building.name)")
				})
	}
	
	var destination: some View {
		BuildingDetailsView(viewModel: viewModel.detailsViewModel)
			.onAppear(perform: {
				print("onAppear BuildingDetailsView \(viewModel.building.name)")
			})
	}
	
	var label: some View {
		BuildingRowView(building: viewModel.building)
			.onAppear(perform: {
			print("onAppear BuildingRowView \(viewModel.building.name)")
		 })
	}
}

class BuildingListViewItemModel: Identifiable {
	var building: Building
	var detailsViewModel: BuildingDetailsViewModel
	var id: Int {
		return building.number
	}
	
	init(building: Building) {
		self.building = building
		self.detailsViewModel = BuildingDetailsViewModel(building: building)
	}
}
