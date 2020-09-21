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
				NavigationLink(
					destination:
						BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: building)),
					label: {
						BuildingRowView(building: building)
					})
			}
		}.listStyle(PlainListStyle())
	}
}

struct BuildingListView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListView()
	}
}
