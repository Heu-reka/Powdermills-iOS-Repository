//
//  BuildingsTests.swift
//  PowdermillsTests
//
//  Created by James Sadlier on 13/09/2020.
//

import XCTest
@testable import Powdermills

class BuildingsTests: XCTestCase {
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testLoad() throws {
		let viewModel = BuildingListViewModel()
		XCTAssert(viewModel.buildings.count > 0)
	}
	
	func testDuplicates() throws {
		let viewModel = BuildingListViewModel()
		let buildingsSet = Set(viewModel.buildings)
		XCTAssert(viewModel.buildings.count == buildingsSet.count)
	}
	
	func testCharacterCount() throws {
		let viewModel = BuildingListViewModel()
		_ = viewModel.buildings.map({ XCTAssert( $0.longHistory.count <= Building.longHistoryCharacterCount, "\($0.name)'s longHistory is over the longHistoryCharacterCount (\(Building.longHistoryCharacterCount)) by \($0.longHistory.count - Building.longHistoryCharacterCount)" ) })
	}
}
