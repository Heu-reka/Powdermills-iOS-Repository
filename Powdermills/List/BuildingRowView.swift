//
//  BuildingRowView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct BuildingRowView: View {
	var building: FSBuilding
	
	var body: some View {
		ZStack {
			if building.coverImagePath != "" {
				buildingImage
			}
			gradient
			VStack {
				Spacer()
				HStack {
					Text("\(building.name)")
						.font(Font.buildingListTitleFont)
						.foregroundColor(.listTextColor)
						.padding(.trailing, 122)
					Spacer()
					chevron
				}.padding()
			}
		}.frame(height: 146, alignment: .center)
	}
	
	var gradient: some View {
		LinearGradient(gradient: Gradient(colors: [.gradiant3, .gradiant2, .gradiant1, .gradiant0]), startPoint: .bottom, endPoint: .center)
			.opacity(0.95)
	}
	
	var chevron: some View {
		Image(systemName: "chevron.right")
			.resizable()
			.aspectRatio(contentMode: ContentMode.fit)
			.frame(width: 10, height: 10, alignment: .center)
			.foregroundColor(.listTextColor)
	}
	
	var buildingImage: some View {
		WebImage(url: URL(string: building.coverImagePath))
			.resizable()
			.scaledToFill()
			.frame(height: 146)
			.clipped()
	}
}

#if DEBUG
struct BuildingRowView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ScrollView(.vertical) {
				LazyVStack(alignment: .center, spacing: 20, content: {
					BuildingRowView(building: FSBuilding.debugBuilding())
					BuildingRowView(building: FSBuilding.debugBuilding())
					BuildingRowView(building: FSBuilding.debugBuilding())
					BuildingRowView(building: FSBuilding.debugBuilding())
					BuildingRowView(building: FSBuilding.debugBuilding())
				})
				.padding()
			}
			.environment(\.colorScheme, .light)
			
			List {
				BuildingRowView(building: FSBuilding.debugBuilding())
				BuildingRowView(building: FSBuilding.debugBuilding())
				BuildingRowView(building: FSBuilding.debugBuilding())
				BuildingRowView(building: FSBuilding.debugBuilding())
				BuildingRowView(building: FSBuilding.debugBuilding())
				
			}
			.listStyle(DefaultListStyle())
			.environment(\.colorScheme, .dark)
		}
	}
}
#endif
