//
//  ParkMapView.swift
//  Powdermills
//
//  Created by James Sadlier on 09/11/2020.
//

import SwiftUI
import Mapbox
import Combine

struct ParkMapView: View {
	
	/// View model of buildings list
	@ObservedObject var buildingListViewModel: BuildingListViewModel
	
	/// View model for map view
	@ObservedObject var viewModel = ParkMapViewModel()
	
	var body: some View {
		VStack {
			NavigationLink(
				destination: buildingDetailsView() ,
				isActive: $viewModel.showingDetails,
				label: {
					EmptyView()
				})
			MapView(viewModel: buildingListViewModel)
				.centerCoordinate(ParkMapViewModel.parkCenterPoint).zoomLevel(16)
				.edgesIgnoringSafeArea(.vertical)
		}.onAppear {
			viewModel.showingDetails = false
		}
	}
	
	func buildingDetailsView() -> AnyView {
		guard let selectedBuldling = buildingListViewModel.buildings.first(where: {$0.orders == viewModel.buildingOrders}) else {
			return AnyView(EmptyView())
		}
		return AnyView(BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: selectedBuldling)))
	}
}

struct ParkMapView_Previews: PreviewProvider {
	static var previews: some View {
		ParkMapView(buildingListViewModel: BuildingListViewModel())
	}
}
