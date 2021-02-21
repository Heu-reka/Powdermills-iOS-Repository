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
	@State var notAcceptedTerms: Bool = UserDefaults.standard.bool(forKey: TermsAndConditionsView.ACCEPTED_TERMS) != true
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.fullScreenCover(isPresented: $notAcceptedTerms, content: {
					TermsAndConditionsView()
				})
		}
	}
}

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!
		let options = FirebaseOptions(contentsOfFile: filePath)
		FirebaseApp.configure(options: options!)
		
		return true
	}
}
