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
	var buildingViewModels: [BuildingListItemViewModel]
	private var buildingsListenerRegistration: ListenerRegistration?
	
	public var didLoadBuildings = PassthroughSubject<Int, Error>()
	
	init() {
		//for uploader only
//		if let jsonPath = Bundle.main.path(forResource: "buildings", ofType: "json") {
//			do {
//				let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
//				self.buildings = try JSONDecoder().decode([FSBuilding].self, from: jsonData)
//				buildingViewModels = [BuildingListItemViewModel]()
//				for b in buildings {
//					let bvm = BuildingListItemViewModel(building: b)
//					buildingViewModels.append(bvm)
//				}
//				return
//			} catch {
//				print("Error loading buildings.json: \(error)")
//			}
//		}
		
		buildings = [FSBuilding]()
		buildingViewModels = [BuildingListItemViewModel]()
	}
	
	public func loadData() {
		FirestoreController.sharedInstance.buildingsCollection.order(by: "orders").getDocuments { snapshot, error in
			if let dataLoadError = error {
				self.didLoadBuildings.send(completion: .failure(dataLoadError))
			}
			if let allBuildings = snapshot?.documents {
				self.objectWillChange.send()
				//clear
				self.buildings.removeAll()
				self.buildingViewModels.removeAll()
				for b in allBuildings {
					do {
						let fsb = try FirestoreDecoder().decode(FSBuilding.self, from: b.data())
						self.buildings.append(fsb)
						self.buildingViewModels.append(BuildingListItemViewModel(building: fsb))
					} catch {
						PMLogger.sharedInstance.databaseLog.error("\("Error getting building list", privacy: .public) \("\(error)", privacy: .private)")
					}
				}
				self.didLoadBuildings.send(self.buildings.count)
			}
		}
	}
}
