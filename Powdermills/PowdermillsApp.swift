//
//  PowdermillsApp.swift
//  Powdermills
//
//  Created by James Sadlier on 30/08/2020.
//

import SwiftUI
import FirebaseCore

@main
struct PowdermillsApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		//			FirebaseApp.configure()
		
		let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!
		let options = FirebaseOptions(contentsOfFile: filePath)
		FirebaseApp.configure(options: options!)
		
		return true
	}
}
