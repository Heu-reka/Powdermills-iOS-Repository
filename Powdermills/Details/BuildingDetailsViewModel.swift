//
//  BuildingDetailsViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 14/09/2020.
//

import Foundation

class BuildingDetailsViewModel {
	
	/// Firestore building
	var building: FSBuilding
	
	init(building: FSBuilding) {
		self.building = building
	}
}
