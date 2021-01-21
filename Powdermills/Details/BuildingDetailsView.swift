//
//  BuildingDetailsView.swift
//  Powdermills
//
//  Created by James Sadlier on 14/09/2020.
//

import SwiftUI

struct BuildingDetailsView: View {
	var viewModel: BuildingDetailsViewModel
	
	@State var imageIndex: Int = 0
	
	var body: some View {
		ScrollView {
			Section(header: buildingImageView, content: {
				history
				function
				if viewModel.building.funFacts.count > 0 {
					trivia
				}
			})
		}
		.navigationBarTitle("\(viewModel.building.name)")
	}
	
	var buildingImageView: some View {
		ZStack {
			GeometryReader { g in
				//TODO: Make a carousel
				Image(viewModel.building.imageName)
					.resizable()
					.scaledToFill()
					.frame(width: g.size.width, height: g.size.height)
					.clipped()
			}
			gradient
			VStack {
				Spacer()
				Text("\(viewModel.building.name)")
					.foregroundColor(.listTextColor)
					.padding()
			}
		}
		.frame(height: 146, alignment: .center)
		.padding(.bottom, -8)
	}
	
	var carousel: some View {
		TabView(selection: $imageIndex,
						content:  {
							Text("")
								.tabItem {
									Text("Tab Label 1")
								}.tag(1)
							Text("")
								.tabItem {
									Text("Tab Label 2")
								}.tag(2)
						}).tabViewStyle(PageTabViewStyle())
	}
	
	func carouselImage(at index: Int) -> AnyView {
		return AnyView (
			Text("")
				.tabItem {
					Image("")
				}.tag(index)
		)
	}
	
	var gradient: some View {
		LinearGradient(gradient: Gradient(colors: [.gradiant3, .gradiant2, .gradiant1, .gradiant0]), startPoint: .bottom, endPoint: .center)
			.opacity(0.95)
	}
	
	var history: some View {
		VStack {
			BuildingSubtitleView(text: "History", color: Color.historyColor, textColor: Color.white)
			Text(viewModel.building.history)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
		}
	}
	
	var function: some View {
		VStack {
			BuildingSubtitleView(text: "Function", color: Color.functionColor, textColor: Color.white)
			Text("\(viewModel.building.function)")
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
		}
	}
	
	var trivia: some View {
		VStack {
			BuildingSubtitleView(text: "Trivia", color: Color.triviaColor, textColor: Color.white)
			Text(viewModel.building.funFacts)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding()
		}
	}
}

struct BuildingDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		BuildingDetailsView(viewModel: BuildingDetailsViewModel(building: Building.debugBuilding()))
	}
}
