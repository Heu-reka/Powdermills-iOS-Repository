//
//  ParkMapViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 21/03/2021.
//

import Foundation
import Mapbox
import Combine

/// Map view model
public class ParkMapViewModel: ObservableObject {
	
	/// ObjectWillChange for observable
	public var objectWillChange = PassthroughSubject<Void, Never>()
	
	/// Watch on the publisher for tap events on an annotation
	private var annotationWatch: AnyCancellable?
	
	/// Flag for showing building details
	@Published var showingDetails = false
	
	/// Identifier for which buliding to show
	@Published var buildingOrders: Int = -1
	
	/// The lat, long of the park
	public static let parkCenterPoint = CLLocationCoordinate2D(latitude: 51.893782, longitude: -8.590463)
	
	init() {
		annotationWatch = MapAnnotationController.sharedInstance.selectedAnnotation.sink { [weak self] buildingOrders in
			self?.objectWillChange.send()
			self?.buildingOrders = buildingOrders
			self?.showingDetails = true
		}
	}
}
