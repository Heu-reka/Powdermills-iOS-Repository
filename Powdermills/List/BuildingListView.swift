//
//  BuildingListView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI
import  Combine

struct BuildingListView: View {
	@ObservedObject var viewModel: BuildingListViewModel
	
	var body: some View {
		ScrollView(.vertical) {
			LazyVStack(alignment: .center, spacing: 0, content: {
				ForEach(viewModel.buildingViewModels) { viewModel in
					BuildingListItemView(viewModel: viewModel)
				}
			})
		}
	}
}

struct BuildingListView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingListView(viewModel: BuildingListViewModel())
	}
}


