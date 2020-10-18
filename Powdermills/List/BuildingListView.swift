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
		ScrollView(.vertical) {
			LazyVStack(alignment: .center, spacing: 20, content: {
				Spacer()
				ForEach(viewModel.buildings) { building in
					NavigationLink(
						destination:
							BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: building)),
						label: {
							BuildingRowView(building: building)
						})
				}
			}).padding(.horizontal, 40)
		}
	}
}

struct BuildingListView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListView()
	}
}
