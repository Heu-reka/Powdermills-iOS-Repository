//
//  BuildingRowView.swift
//  Powdermills
//
//  Created by James Sadlier on 13/09/2020.
//

import SwiftUI

struct BuildingRowView: View {
	var building: Building
	
	var body: some View {
		ZStack {
			Rectangle()
				.frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .center)
				.foregroundColor(.listItemBackgroundColor)
				.shadow(radius: 8)
			HStack {
				dot
					.padding(.trailing, 2)				
				Text("\(building.name)")
					.foregroundColor(.listTextColor)
				Spacer()
				chevron
			}.padding()
		}
	}
	
	var dot: some View {
		Image(systemName: "circle.fill")
			.resizable()
			.aspectRatio(contentMode: ContentMode.fit)
			.frame(width: 10, height: 10, alignment: .center)
			.foregroundColor(.listDotColor)
	}
	
	var chevron: some View {
		Image(systemName: "chevron.right")
			.resizable()
			.aspectRatio(contentMode: ContentMode.fit)
			.frame(width: 10, height: 10, alignment: .center)
			.foregroundColor(.listChevronColor)
	}
	
	var buildingImage: some View {
		ZStack {
			Circle()
				.foregroundColor(.secondary)
				.frame(width: 81, height: 81, alignment: .center)
				.shadow(radius: 2)
			Image(building.imageName)
				.resizable()
				.aspectRatio(contentMode: ContentMode.fill)
				.frame(width: 80, height: 80, alignment: .center)
				.clipShape(Circle())
		}
	}
	
}

struct BuildingRowView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ScrollView(.vertical) {
				LazyVStack(alignment: .center, spacing: 20, content: {
					BuildingRowView(building: Building.debugBuilding())
					BuildingRowView(building: Building.debugBuilding())
					BuildingRowView(building: Building.debugBuilding())
					BuildingRowView(building: Building.debugBuilding())
					BuildingRowView(building: Building.debugBuilding())
				})
				.padding()
			}
			
			List {
				BuildingRowView(building: Building.debugBuilding())
				BuildingRowView(building: Building.debugBuilding())
				BuildingRowView(building: Building.debugBuilding())
				BuildingRowView(building: Building.debugBuilding())
				BuildingRowView(building: Building.debugBuilding())
				
			}.listStyle(DefaultListStyle())
		}
	}
}
