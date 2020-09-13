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
		HStack {
			buildingImage
			Spacer()
			buildingText
		}.padding(.vertical)
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
	
	var buildingText: some View {
		VStack {
			Text(building.name)
				.font(.headline)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
			Text(building.short)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
		}
	}
}

struct BuildingRowView_Previews: PreviewProvider {
	static var previews: some View {
		List {
			BuildingRowView(building: Building.debugBuilding())
			BuildingRowView(building: Building.debugBuilding())
			BuildingRowView(building: Building.debugBuilding())
			BuildingRowView(building: Building.debugBuilding())
			BuildingRowView(building: Building.debugBuilding())
			
		}.listStyle(DefaultListStyle())
	}
}
