//
//  Building.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation

struct Building: Codable, Identifiable {
	public static let longHistoryCharacterCount = 2000
	
	var number: Int = -1
	var name: String = ""
//	var short: String = ""
	var history: String = ""
	var function: String = ""
	var funFacts: String = ""
//	var longHistory: String = ""
	var imageName: String = ""
	
	var id: Int {
		number
	}
	
	static func debugBuilding() -> Building {
		return Building(number: 42, name: "Test building"/*, short: "It's a building for testing"*/, history: "Just made it up now", function: "It's for testing layout", funFacts: "It's not a real building"/*, longHistory: "Just made it up on Sunday night"*/, imageName: "989484_5e3ee76a")
	}
}
