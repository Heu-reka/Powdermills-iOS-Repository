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
			if building.imageName != "" {
				buildingImage
			}
			gradient
			VStack {
				Spacer()
				HStack {
					Text("\(building.name)")
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
//		Rectangle()
//			.strokeBorder(LinearGradient(gradient: Gradient(colors: [.gradiant3, .gradiant2, .gradiant1, .gradiant0]), startPoint: .bottom, endPoint: .center), lineWidth: 50)
//			.opacity(0.95)
	}
	
	var chevron: some View {
		Image(systemName: "chevron.right")
			.resizable()
			.aspectRatio(contentMode: ContentMode.fit)
			.frame(width: 10, height: 10, alignment: .center)
			.foregroundColor(.listTextColor)
	}
	
	var buildingImage: some View {
		GeometryReader { geo in
			Image(building.imageName)
				.resizable()
				.scaledToFill()
				.frame(width: geo.size.width, height: geo.size.height)
				.clipped()
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
