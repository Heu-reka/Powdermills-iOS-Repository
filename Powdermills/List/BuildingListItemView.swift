//
//  BuildingListItemView.swift
//  Powdermills
//
//  Created by James Sadlier on 21/03/2021.
//

import Foundation
import SwiftUI

struct BuildingListItemView: View {
	var viewModel: BuildingListItemViewModel
	
	var body: some View {
		NavigationLink(
			destination:
				BuildingDetailsView(viewModel: viewModel.detailsViewModel),
			label: {
				BuildingRowView(building: viewModel.building)
			})
	}
}

#if DEBUG
struct BuildingListItemView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListItemView(viewModel: BuildingListItemViewModel(building: FSBuilding.debugBuilding()))
	}
}
#endif
