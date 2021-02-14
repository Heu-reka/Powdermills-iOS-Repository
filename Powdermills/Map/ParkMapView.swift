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
	
	@ObservedObject var buildingListViewModel: BuildingListViewModel
	@ObservedObject var viewModel = ParkMapViewModel()
	
	var body: some View {
		VStack {
			NavigationLink(
				destination: building() ,
				isActive: $viewModel.showingDetails,
				label: {
					EmptyView()
				})
			MapView(viewModel: buildingListViewModel)
				.centerCoordinate(.init(latitude: 51.893782, longitude: -8.590463)).zoomLevel(16)
				.edgesIgnoringSafeArea(.vertical)
		}.onAppear {
			viewModel.showingDetails = false
		}
	}
	
	func building() -> AnyView {
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
 
public class ParkMapViewModel: ObservableObject {
	public var objectWillChange = PassthroughSubject<Void, Never>()
	@Published var showingDetails = false
	private var annotationWatch: AnyCancellable?
	@Published var buildingOrders: Int = -1
	
	init() {
		annotationWatch = MapAnnotationController.sharedInstance.selectedAnnotation.sink { [weak self] buildingOrders in
			self?.objectWillChange.send()
			self?.buildingOrders = buildingOrders
			self?.showingDetails = true
		}
	}
}

