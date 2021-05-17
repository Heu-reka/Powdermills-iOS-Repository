//
//  BuildingTests.swift
//  PowdermillsTests
//
//  Created by James Sadlier on 20/03/2021.
//

import XCTest
@testable import Powdermills

class BuildingTests: XCTestCase {
	
	override func setUpWithError() throws {
		
	}
	
	override func tearDownWithError() throws {
		
	}
	
	func testDictionary() throws {
		let seedDictionary = [
			"orders": 11,
			"name": "name",
			"history": "history ",
			"function": "function",
			"funFacts": ["funFacts"],
			"coverImagePath": "coverImagePath",
			"imagePaths": ["imagePaths"],
			"latitude": 11.0,
			"longitude": 11.0,
			"iconAndroid": "iconAndroid",
			"iconiOS": "iconiOS"
		] as [String : Any]
		
		let seedBuilding = FSBuilding(orders: seedDictionary["orders"] as? Int ?? 0,
																	name: seedDictionary["name"] as? String ?? "",
																	history: seedDictionary["history"] as? String ?? "",
																	function: seedDictionary["function"] as? String ?? "",
																	funFacts: seedDictionary["funFacts"] as? [String] ?? [""],
																	coverImagePath: seedDictionary["coverImagePath"] as? String ?? "",
																	imagePaths: seedDictionary["imagePaths"] as? [String] ?? [""],
																	latitude: seedDictionary["latitude"] as? Double ?? 7.0,
																	longitude: seedDictionary["longitude"] as? Double ?? 7.0,
																	iconAndroid: seedDictionary["iconAndroid"] as? String ?? "",
																	iconiOS: seedDictionary["iconiOS"] as? String ?? "")
		
		if let dictionary = seedBuilding.dictionary() {
			let building = FSBuilding(orders: dictionary["orders"] as? Int ?? 13,
																name: dictionary["name"] as? String ?? "other",
																history: dictionary["history"] as? String ?? "other",
																function: dictionary["function"] as? String ?? "other",
																funFacts: dictionary["funFacts"] as? [String] ?? ["other"],
																coverImagePath: dictionary["coverImagePath"] as? String ?? "other",
																imagePaths: dictionary["imagePaths"] as? [String] ?? ["other"],
																latitude: dictionary["latitude"] as? Double ?? 13.0,
																longitude: dictionary["longitude"] as? Double ?? 13.0,
																iconAndroid: dictionary["iconAndroid"] as? String ?? "other",
																iconiOS: dictionary["iconiOS"] as? String ?? "other")
			XCTAssert(building == seedBuilding, "Failed to generate building from exported dictionary values")
		} else {
			XCTFail("Failed to create dictionary")
		}
	}
}
