//
//  BuildingDetailsView.swift
//  Powdermills
//
//  Created by James Sadlier on 14/09/2020.
//

import SwiftUI

struct BuildingDetailsView: View {
	var viewModel: BuildingDetailsViewModel
	
	var body: some View {
		ScrollView {
			Image(viewModel.building.imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
			Text("Building number: \(viewModel.building.number)")
				.frame(maxWidth: .infinity, alignment: .leading)
			Text("Building function: \(viewModel.building.function)")
				.frame(maxWidth: .infinity, alignment: .leading)
			Divider()
			Text("History")
				.font(.headline)
				.frame(maxWidth: .infinity, alignment: .leading)
			Text(viewModel.building.longHistory)
				.frame(maxWidth: .infinity, alignment: .leading)
			Spacer()
			Text("Fun Facts")
				.font(.headline)
				.frame(maxWidth: .infinity, alignment: .leading)
			Text(viewModel.building.funFacts)
				.frame(maxWidth: .infinity, alignment: .leading)
				.navigationBarTitle(viewModel.building.name, displayMode: .inline)
		}.padding()
	}
}

struct BuildingDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: Building.debugBuilding()))
	}
}
