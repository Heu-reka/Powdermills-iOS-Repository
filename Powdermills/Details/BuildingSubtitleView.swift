//
//  BuildingSubtitleView.swift
//  Powdermills
//
//  Created by James Sadlier on 07/12/2020.
//

import SwiftUI

/// Buildinig details subtitle
struct BuildingSubtitleView: View {
	var text: String
	var color: Color
	var textColor: Color
	
	var body: some View {
		ZStack {
			ZStack {
				Rectangle()
					.foregroundColor(color)
					.padding(.bottom, 15)
				Triangle()
					.frame(width: 60, alignment: .center)
					.foregroundColor(color)
					.padding(.top, 50)
			}
			Text(text)
				.font(Font.buildingSubtitleFont)
				.foregroundColor(textColor)
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				.padding(.bottom, 15)
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 65, maxHeight: 65, alignment: .center)
	}
}

struct BuildingSubtitleView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			Spacer()
			BuildingSubtitleView(text: "Title in green", color: Color.green, textColor: Color.white)
			Spacer()
			BuildingSubtitleView(text: "Title in blue", color: Color.blue, textColor: Color.white)
			Spacer()
			BuildingSubtitleView(text: "Title in green", color: Color.green, textColor: Color.black)
			Spacer()
			BuildingSubtitleView(text: "Title in blue", color: Color.blue, textColor: Color.black)
			Spacer()
		}
	}
}


/// Triangle shape for building details subtitles
struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: rect.minX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		return path
	}
}
