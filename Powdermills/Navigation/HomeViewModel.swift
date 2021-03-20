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
//			return "map"
		case .map:
			return "togglelist"
//			return "list.dash"
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

class HomeViewModel: ObservableObject {
	var objectWillChange = PassthroughSubject<Void, Never>()
	@Published var state: HomeState = .list
	var listViewModel: BuildingListViewModel = BuildingListViewModel()
}
