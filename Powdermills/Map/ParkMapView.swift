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
	
	@ObservedObject var viewModel: BuildingListViewModel
	
	var body: some View {
		MapView(annotations: .constant([MGLPointAnnotation]()), viewModel: viewModel)
			.centerCoordinate(.init(latitude: 51.893782, longitude: -8.590463)).zoomLevel(16)
			.edgesIgnoringSafeArea(.vertical)
	}
}

struct ParkMapView_Previews: PreviewProvider {
	static var previews: some View {
		ParkMapView(viewModel: BuildingListViewModel())
	}
}
