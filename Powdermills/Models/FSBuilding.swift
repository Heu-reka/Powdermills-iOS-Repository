//
//  FSBuilding.swift
//  Powdermills
//
//  Created by James Sadlier on 20/03/2021.
//

import Foundation
import CodableFirebase

/// Firestore Building
public struct FSBuilding: Codable, Identifiable, Hashable {
	
	public var orders: Int = -1
	public var name: String = ""
	public var history: String = ""
	public var function: String = ""
	public var funFacts: [String] = [String]()
	public var coverImagePath: String = ""
	public var imagePaths: [String] = [String]()

	public var latitude: Double = -180
	public var longitude: Double = -180
		
	public var iconAndroid: String = ""
	public var iconiOS: String = ""
	
	public var id: Int {
		orders
	}
	
	/// Return a dictionary representation of the building
	/// - Returns: an optional dictionary 
	public func dictionary() -> [String: Any]? {
		var dictionary: [String: Any]?
		do {
			dictionary = try FirestoreEncoder().encode(self)
		} catch {
			PMLogger.sharedInstance.databaseLog.error("\("Error encoding building", privacy: .public) \("\(self): \(error)", privacy: .private)")
		}
		return dictionary
	}
	
	#if DEBUG
	static func debugBuilding() -> FSBuilding {
		return FSBuilding(orders: 0, name: "Incorporating Mill", history: "The original gunpowder mills had 4 Incorporating Mills. This was increased to 12 Incorporating mills by the next owners, the British Board of Ordnance, and finally to 24 Incorporating Mills by the third owners, Tobin & Horsfall.", function: "An Incorporating Mill finely ground a mixture of saltpetre, sulphur and charcoal together to product crude gunpowder. The process used two heavy millstones to carry out the operation. The millstones were rotated by a mechanical system powered by a water wheel.", funFacts: ["The original Incorporating Mills buildings were made of wood and have not survived. The building you see today is a modern reconstruction built in 1993. The large stone walls you see in the Incorporating Mills area are blast walls to prevent an explosion in one set of the incorporating mills spreading to neighbouring incorporating mills."], coverImagePath: "https://firebasestorage.googleapis.com/v0/b/powdermills-dd66a.appspot.com/o/Building%20One%2Fbuilding1_incorporatingmills_11.jpg?alt=media", imagePaths: ["https://firebasestorage.googleapis.com/v0/b/powdermills-dd66a.appspot.com/o/Building%20One%2Fbuilding1_incorporatingmills_11.jpg?alt=media", "https://firebasestorage.googleapis.com/v0/b/powdermills-dd66a.appspot.com/o/Building%20One%2Fbuilding1_incorporatingmills_1.jpg?alt=media"], latitude: 51.893755, longitude: -8.5898981)
	}
	#endif
}
