//
//  BuildingListItemViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 21/03/2021.
//

import Foundation

class BuildingListItemViewModel: Identifiable {
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
