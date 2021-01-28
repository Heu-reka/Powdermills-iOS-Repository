//
//  BuildingListViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation
import FirebaseFirestore
import CodableFirebase
import Combine

class BuildingListViewModel: ObservableObject {
	var objectWillChange = PassthroughSubject<Void, Never>()
	
	var buildings: [FSBuilding]
	var buildingViewModels: [BuildingListViewItemModel]
	private var buildingsListenerRegistration: ListenerRegistration?
	
	init() {
		//for uploader only
		
//		if let jsonPath = Bundle.main.path(forResource: "buildings", ofType: "json") {
//			do {
//				let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
//				self.buildings = try JSONDecoder().decode([FSBuilding].self, from: jsonData)
//				buildingViewModels = [BuildingListViewItemModel]()
//				for b in buildings {
//					let bvm = BuildingListViewItemModel(building: b)
//					buildingViewModels.append(bvm)
//				}
//				return
//			} catch {
//				print("Error loading buildings.json: \(error)")
//			}
//		}
		
		buildings = [FSBuilding]()
		buildingViewModels = [BuildingListViewItemModel]()
		
		
		BuildingUploader.sharedInstance.buildingsCollection.getDocuments { snapshot, error in
			if let allBuildings = snapshot?.documents {
				self.objectWillChange.send()
				//clear
				self.buildings.removeAll()
				self.buildingViewModels.removeAll()
				
				for b in allBuildings {
					do {
						let fsb = try FirestoreDecoder().decode(FSBuilding.self, from: b.data())
						self.buildings.append(fsb)
						self.buildingViewModels.append(BuildingListViewItemModel(building: fsb))
						
					} catch {
						print("Error: \(error)")
					}
				}
			}
		}
	}
}
