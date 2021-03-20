//
//  TermsAndConditionsView.swift
//  Powdermills
//
//  Created by McCoy Zhu on 10/4/20.
//

import SwiftUI

struct TermsAndConditionsView: View {
	static let ACCEPTED_TERMS = "AcceptedTerms"
	@State var agreed = false
	@Environment(\.presentationMode) var presentation
	
	func BoldedText(_ line: Substring) -> some View {
		//        let titleRegex = try! NSRegularExpression(pattern: "^[1-9][0-9]?. ")
		//        let str = String(line)
		//        let isTitle = titleRegex.firstMatch(in: str, range: NSRange(location: 0, length: str.utf16.count))
		var isBold = true
		
		return line.components(separatedBy: "\\*\\*").reduce(Text(""), {
			isBold.toggle()
			return $0 + Text($1).fontWeight(isBold ? .bold : .medium)
		})
		//        .font(isTitle == nil ? .body : .title3).padding(.top, isTitle == nil ? 0 : 10)
	}
	
	let termsAndConditionsText = TermsAndConditionsText()
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [Color("Gradient_Top"), Color("Gradient_Bottom")]), startPoint: .top, endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)
			
			HStack {
				Spacer()
				
				VStack {
					
					Text("Terms and Conditions")
						.font(.title)
						.fontWeight(.semibold)
						.padding(.top, 28)
					
					ScrollView {
						ForEach(self.termsAndConditionsText.text.split(separator: "\r"), id: \.self) { (line: Substring) in
							BoldedText(line)
								.frame(maxWidth: .infinity, alignment: .leading)
								.padding(1)
						}
					}.padding(.horizontal)
					
					Button(action: {
						self.agreed.toggle()
						UserDefaults.standard.setValue(self.agreed, forKey: TermsAndConditionsView.ACCEPTED_TERMS)
						UserDefaults.standard.synchronize()
						PMLogger.sharedInstance.log(string: "Acceppted terms")
					}, label: {
						HStack(alignment: .firstTextBaseline) {
							Image(systemName: self.agreed ? "checkmark.square.fill" : "square")
							
							Text("I have read and agree to the terms and conditions")
								.fontWeight(.medium)
						}.foregroundColor(Color("AccentColor"))
					}).padding(.top, 15)
					.padding(.bottom, 10)
					.padding(.horizontal)
					
					Button(action: {
						self.presentation.wrappedValue.dismiss()
					}, label: {
						Text("Continue")
							.foregroundColor(.white)
							.fontWeight(.medium)
							.padding(.vertical, 10)
							.padding(.horizontal, 35)
							.background(Color.accentColor)
							.cornerRadius(20)
							.padding(.bottom, 30)
							.opacity(self.agreed ? 1 : 0.5)
							.animation(.default, value: self.agreed)
					}).disabled(!self.agreed)
				}
				
				Spacer()
			}.background(Color(UIColor.systemBackground))
			.cornerRadius(15)
			.padding(.horizontal, 25)
			.padding(.vertical, 100)
			.shadow(radius: 8)
		}
	}
}

struct TermsAndConditionsView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			TermsAndConditionsView()
				.environment(\.colorScheme, .light)
			
			TermsAndConditionsView()
				.environment(\.colorScheme, .dark)
		}
	}
}
