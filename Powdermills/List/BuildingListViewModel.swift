//
//  BuildingListViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation

class BuildingListViewModel {
	var buildings: [Building]
	var buildingViewModels: [BuildingListViewItemModel]
	
	init() {
		if let jsonPath = Bundle.main.path(forResource: "buildings", ofType: "json") {
			do {
				let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
				self.buildings = try JSONDecoder().decode([Building].self, from: jsonData)
				buildingViewModels = [BuildingListViewItemModel]()
				for b in buildings {
					let bvm = BuildingListViewItemModel(building: b)
					buildingViewModels.append(bvm)
				}
				return
			} catch {
				print("Error loading buildings.json: \(error)")
			}
		}
		buildings = [Building]()
		buildingViewModels = [BuildingListViewItemModel]()
	}
}
