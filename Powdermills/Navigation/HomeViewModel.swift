//
//  HomeViewModel.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import Foundation

enum HomeState {
	case list
	case map
	
	mutating func toggle() {
		self = self == .list ? .map : .list
	}
	
	func buttonImage() -> String {
		switch self {
		case .list:
			return "map"
		case .map:
			return "list.dash"
		}
		
	}
}

class HomeViewModel {
	var state: HomeState = .list
	var listViewModel: BuildingListViewModel = BuildingListViewModel()
}
