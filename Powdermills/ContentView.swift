//
//  ContentView.swift
//  Powdermills
//
//  Created by James Sadlier on 30/08/2020.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			HomeView()
		}.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
