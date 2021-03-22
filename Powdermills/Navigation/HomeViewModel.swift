//
//  HomeViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation
import Combine

enum HomeState {
	case list
	case map
	
	mutating func toggle() {
		self = self == .list ? .map : .list
	}
	
	func buttonImage() -> String {
		switch self {
		case .list:
			return "togglemap"
		case .map:
			return "togglelist"
		}
	}
	
	func modeTitle() -> String {
		switch self {
		case .list:
			return "Building List"
		case .map:
			return "Park Map"
		}
	}
}

/// Home view model
class HomeViewModel: ObservableObject {
	
	/// objectWillChange
	var objectWillChange = PassthroughSubject<Void, Never>()
	
	/// Published `HomeState` set to list as default
	@Published var state: HomeState = .list
	 
	/// BuildingListViewModel
	var listViewModel: BuildingListViewModel = BuildingListViewModel()
}
