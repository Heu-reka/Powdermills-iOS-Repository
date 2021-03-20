//
//  Building.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation


/// Used to parse JSON building list, only used for uploading
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
	
	func firebaseBuilding() -> FSBuilding {
		FSBuilding(orders: Int(buildingOrder) ?? -1, name: name, history: shortHistory, function: function, funFacts: funFacts, coverImagePath: cover, imagePaths: images, latitude: lat, longitude: long, iconAndroid: androidIcon, iconiOS: iOSIcon)
	}
}
