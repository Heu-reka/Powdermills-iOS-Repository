//
//  BuildingUploader.swift
//  Powdermills
//
//  Created by James Sadlier on 21/01/2021.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import CodableFirebase

extension DocumentReference: DocumentReferenceType {}
extension GeoPoint: GeoPointType {}
extension FieldValue: FieldValueType {}
extension Timestamp: TimestampType {}


public class BuildingUploader {
	public fileprivate(set) static var sharedInstance = BuildingUploader()
	
	private var buildingsPath: String {
		"Buildings"
	}
	
	public var buildingsCollection: CollectionReference {
		Firestore.firestore().collection(self.buildingsPath)
	}
	
	public func buildingDocument(buildingDocumentId: String) -> DocumentReference {
		Firestore.firestore().document("\(buildingsPath)/\(buildingDocumentId)")
	}
	
	private func addBuilding(fireStoreBuilding: FSBuilding ){
		if let fireStoreBuildingJSON = fireStoreBuilding.dictionary() {
			let doc = BuildingUploader.sharedInstance.buildingsCollection.addDocument(data: fireStoreBuildingJSON)
			print(doc)
			
		}
	}
	
	public func addJSONBuildingsToFirestore() {
		if let jsonPath = Bundle.main.path(forResource: "buildings", ofType: "json") {
			do {
				let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
				let buildings = try JSONDecoder().decode([JSONBuilding].self, from: jsonData)
				for building in buildings {
					BuildingUploader.sharedInstance.addBuilding(fireStoreBuilding: building.firebaseBuilding())
				}
			} catch {
				print("Error loading buildings.json: \(error)")
			}
		}
	}

}
