//
//  BuildingListViewModelTests.swift
//  PowdermillsTests
//
//  Created by James Sadlier on 13/09/2020.
//

import XCTest
import Combine
@testable import Powdermills

class BuildingListViewModelTests: XCTestCase {
	
	var viewModel: BuildingListViewModel = BuildingListViewModel()
	
	override func setUpWithError() throws {
		viewModel.loadData()
		let didFinishLoadingBuildingData = XCTestExpectation(description: "DidFinishLoadingBuildingData")
		didFinishLoadingBuildingData.assertForOverFulfill = false
		let publisher = viewModel.didLoadBuildings.sink { error in
			didFinishLoadingBuildingData.fulfill()
			XCTFail("Error: \(error)")
		} receiveValue: { count in
			didFinishLoadingBuildingData.fulfill()
		}
		wait(for: [didFinishLoadingBuildingData], timeout: 3)
		withExtendedLifetime(publisher) { }
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testLoadBuildings() throws {
		XCTAssert(viewModel.buildings.count > 0)
	}
	
	func testDuplicates() throws {
		let buildingsSet = Set(viewModel.buildings)
		XCTAssert(viewModel.buildings.count == buildingsSet.count)
	}
	
}
