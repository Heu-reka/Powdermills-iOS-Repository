//
//  Building.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation

class Building: Codable, Hashable, Identifiable {
	public static let longHistoryCharacterCount = 2000
	
	var number: Int = -1
	var name: String = ""
	var short: String = ""
	var history: String = ""
	var function: String = ""
	var funFacts: String = ""
	var longHistory: String = ""
	var imageName: String = ""
	
	var id: Int {
		number
	}
	
	static func == (lhs: Building, rhs: Building) -> Bool {
		return lhs.number == rhs.number &&
			lhs.name == rhs.name &&
			lhs.short == rhs.short &&
			lhs.history == rhs.history &&
			lhs.function == rhs.function &&
			lhs.funFacts == rhs.funFacts &&
			lhs.longHistory == rhs.longHistory &&
			lhs.imageName == rhs.imageName
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(number)
		hasher.combine(name)
		hasher.combine(short)
		hasher.combine(history)
		hasher.combine(function)
		hasher.combine(funFacts)
		hasher.combine(longHistory)
		hasher.combine(imageName)
	}
	
	static func debugBuilding() -> Building {
		let testBuilding = Building()
		testBuilding.number = 42
		testBuilding.name = "Test building"
		testBuilding.short = "It's a building for testing"
		testBuilding.history = "Just made it up now"
		testBuilding.function = "It's for testing layout"
		testBuilding.funFacts = "It's not a real building"
		testBuilding.longHistory = "Just made it up on Sunday night"
		testBuilding.imageName = "989484_5e3ee76a"
		return testBuilding
	}
}
