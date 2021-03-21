//
//  FirestoreController.swift
//  Powdermills
//
//  Created by James Sadlier on 21/01/2021.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import CodableFirebase

// extensions for the codeable firebase pod
extension DocumentReference: DocumentReferenceType {}
extension GeoPoint: GeoPointType {}
extension FieldValue: FieldValueType {}
extension Timestamp: TimestampType {}

/// Handles all Firestore interactions
public class FirestoreController {
	
	public fileprivate(set) static var sharedInstance = FirestoreController()
	
	/// The buildings collection path
	private var buildingsPath: String {
		"Buildings"
	}
	
	/// The collection reference for the buildings collection
	public var buildingsCollection: CollectionReference {
		Firestore.firestore().collection(self.buildingsPath)
	}
	
	/// Generates the document reference for a building
	/// - Parameter buildingDocumentId: The firestore document id for the building
	/// - Returns: The document reference for the given building
	public func buildingDocument(buildingDocumentId: String) -> DocumentReference {
		Firestore.firestore().document("\(buildingsPath)/\(buildingDocumentId)")
	}
	
	/// Add a new firestore building to the firestore building documents, will add duplicates. No checks are performed and the key on the database is an automatically generated uuid
	/// - Parameter fireStoreBuilding: The new building
	private func addBuilding(fireStoreBuilding: FSBuilding ){
		if let fireStoreBuildingJSON = fireStoreBuilding.dictionary() {
			let doc = FirestoreController.sharedInstance.buildingsCollection.addDocument(data: fireStoreBuildingJSON)
			PMLogger.sharedInstance.databaseLog.log("\("\(doc)", privacy: .private)")
		}
	}
	
	/// Loads json buildings as JSONBuildings and converst them to FSBuilding then uploads them to firebase
	public func addJSONBuildingsToFirestore() {
		if let jsonPath = Bundle.main.path(forResource: "buildings", ofType: "json") {
			do {
				let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
				let buildings = try JSONDecoder().decode([JSONBuilding].self, from: jsonData)
				for building in buildings {
					FirestoreController.sharedInstance.addBuilding(fireStoreBuilding: building.firebaseBuilding())
				}
			} catch {
				PMLogger.sharedInstance.databaseLog.log("Error loading buildings: \("\(error)", privacy: .private)")
			}
		}
	}
}
