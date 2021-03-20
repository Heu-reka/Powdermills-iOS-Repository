//
//  BuildingListView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI
import  Combine

struct BuildingListView: View {
	@ObservedObject var viewModel: BuildingListViewModel
	
	var body: some View {
		ScrollView(.vertical) {
			LazyVStack(alignment: .center, spacing: 0, content: {
				ForEach(viewModel.buildingViewModels) { viewModel in
					BuildingListViewItem(viewModel: viewModel)
				}
			})
		}
	}
}

struct BuildingListView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListView(viewModel: BuildingListViewModel())
	}
}


struct BuildingListViewItem: View {
	var viewModel: BuildingListViewItemModel
	
	var body: some View {
		NavigationLink(
				destination:
					BuildingDetailsView(viewModel: viewModel.detailsViewModel),
				label: {
					BuildingRowView(building: viewModel.building)
				})
	}
}

class BuildingListViewItemModel: Identifiable {
	var building: FSBuilding
	var detailsViewModel: BuildingDetailsViewModel
	
	var id: Int {
		return building.orders
	}
	
	init(building: FSBuilding) {
		self.building = building
		self.detailsViewModel = BuildingDetailsViewModel(building: building)
	}
}
