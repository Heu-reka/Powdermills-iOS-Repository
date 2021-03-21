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
		guard let selecetdBuilding = buildingListViewModel.buildings.filter({$0.orders == viewModel.buildingOrders}).first else {
			return AnyView(EmptyView())
		}
		return AnyView(BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: selecetdBuilding)))
	}
}

struct ParkMapView_Previews: PreviewProvider {
	static var previews: some View {
		ParkMapView(buildingListViewModel: BuildingListViewModel())
	}
}
