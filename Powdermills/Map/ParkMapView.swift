//
//  ParkMapView.swift
//  Powdermills
//
//  Created by James Sadlier on 09/11/2020.
//

import SwiftUI
import Mapbox

struct ParkMapView: View {
	var body: some View {
		MapView(annotations: .constant([MGLPointAnnotation]()))
			.centerCoordinate(.init(latitude: 51.893782, longitude: -8.590463)).zoomLevel(16)
			
	}
}

struct ParkMapView_Previews: PreviewProvider {
	static var previews: some View {
		ParkMapView()
	}
}
