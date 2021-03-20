//
//  Building.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation
import CodableFirebase

struct JSONBuilding: Codable {
	
	public enum JSONBuildingKeys: String, CodingKey, CaseIterable {
		case oldBuildingNumber = "Old"
		case buildingOrder = "App"
		case name = "Building Name"
		case shortHistory = "Short History"
		case function = "Function"
		case funFacts = "Fun Facts"
		case gps = "GPS Coordinates"
		case cover = "Cover"
		case images = "Other Images"
		case androidIcon = "Building Icon Android"
		case iOSIcon = "Building Icon iOS"
	}
	
	public static let longHistoryCharacterCount = 2000
	
	var oldBuildingNumber: Int = 0
	var buildingOrder: String = ""
	var name: String = ""
	var shortHistory: String = ""
	var function: String = ""
	var funFacts: [String] = [String]()
	var lat: Double = 0
	var long: Double = 0
	var cover: String = ""
	var images: [String] = [String]()
	var androidIcon: String = ""
	var iOSIcon: String = ""
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: JSONBuildingKeys.self)
		oldBuildingNumber = try values.decode(Int.self, forKey: .oldBuildingNumber)
		buildingOrder = try values.decode(String.self, forKey: .buildingOrder)
		name = try values.decode(String.self, forKey: .name)
		shortHistory = try values.decode(String.self, forKey: .shortHistory)
		function = try values.decode(String.self, forKey: .function)
		funFacts = try values.decode([String].self, forKey: .funFacts)
		
		if let gpsString = try? values.decode(String.self, forKey: .gps) {
			if let latitude = gpsString.split(separator: ",").first {
				lat = Double(latitude) ?? 0
			}
			if let longitude = gpsString.split(separator: ",").last?.replacingOccurrences(of: " ", with: "") {
				long = Double(longitude) ?? 0
			}
		}
		cover = try values.decode(String.self, forKey: .cover)
		images = try values.decode([String].self, forKey: .images)
		androidIcon = try values.decode(String.self, forKey: .androidIcon)
		iOSIcon = try values.decode(String.self, forKey: .iOSIcon)
	}
	
//	static func debugBuilding() -> JSONBuilding {
//		return JSONBuilding(oldBuildingNumber: 42, buildingOrder: 11, name: "Test building", shortHistory: "Just made it up now", function: "It's for testing layout", funFacts: ["It's not a real building"], cover: "989484_5e3ee76a")
//	}
	
	func firebaseBuilding() -> FSBuilding {
		FSBuilding(orders: Int(buildingOrder) ?? -1, name: name, history: shortHistory, function: function, funFacts: funFacts, coverImagePath: cover, imagePaths: images, latitude: lat, longitude: long, iconAndroid: androidIcon, iconiOS: iOSIcon)
	}
}

public struct FSBuilding: Codable, Identifiable {
	
	public enum FSBuildingKeys: String, CodingKey, CaseIterable {
		case name = "Building Name"
		case cover = "Cover Image"
		case funFacts = "Fun Facts"
		case function = "Function"
		case gps = "GPS Coordinates"
		case history = "Short History"
		case order = "Order"
		case images = "Images"
		case iconAndroid = "Building Icon Android"
		case iconiOS = "Building Icon iOS"
	}
	
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
	
	static func debugBuilding() -> FSBuilding {
		return FSBuilding(orders: 0, name: "Incorporating Mill", history: "The original gunpowder mills had 4 Incorporating Mills. This was increased to 12 Incorporating mills by the next owners, the British Board of Ordnance, and finally to 24 Incorporating Mills by the third owners, Tobin & Horsfall.", function: "An Incorporating Mill finely ground a mixture of saltpetre, sulphur and charcoal together to product crude gunpowder. The process used two heavy millstones to carry out the operation. The millstones were rotated by a mechanical system powered by a water wheel.", funFacts: ["The original Incorporating Mills buildings were made of wood and have not survived. The building you see today is a modern reconstruction built in 1993. The large stone walls you see in the Incorporating Mills area are blast walls to prevent an explosion in one set of the incorporating mills spreading to neighbouring incorporating mills."], coverImagePath: "https://firebasestorage.googleapis.com/v0/b/powdermills-dd66a.appspot.com/o/Building%20One%2Fbuilding1_incorporatingmills_11.jpg?alt=media", imagePaths: ["https://firebasestorage.googleapis.com/v0/b/powdermills-dd66a.appspot.com/o/Building%20One%2Fbuilding1_incorporatingmills_11.jpg?alt=media", "https://firebasestorage.googleapis.com/v0/b/powdermills-dd66a.appspot.com/o/Building%20One%2Fbuilding1_incorporatingmills_1.jpg?alt=media"], latitude: 51.893755, longitude: -8.5898981)
	}
	
	public func dictionary() -> [String: Any]? {
		var dictionary: [String: Any]?
		do {
			dictionary = try FirestoreEncoder().encode(self)
		} catch {
			print("Error encoding \(self)): \(error)")
		}
		return dictionary
	}
	
}
