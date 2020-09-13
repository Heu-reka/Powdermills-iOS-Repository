//
//  BuildingListView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI

struct BuildingListView: View {
	var viewModel = BuildingListViewModel()
	var body: some View {
		List {
			ForEach(viewModel.buildings) { building in
				BuildingRowView(building: building)
			}
		}
	}
}

struct BuildingListView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListView()
	}
}
