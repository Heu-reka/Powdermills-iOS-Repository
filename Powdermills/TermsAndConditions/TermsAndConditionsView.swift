//
//  TermsAndConditionsView.swift
//  Powdermills
//
//  Created by McCoy Zhu on 10/4/20.
//

import SwiftUI

struct TermsAndConditionsView: View {
    @State var agreed = false
    
    @Environment(\.presentationMode) var presentation
    
    let termsAndConditionsText = TermsAndConditionsText()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 42.0/255.0, green: 157.0/255.0, blue: 143.0/255.0), Color(red: 116.0/255.0, green: 191.0/255.0, blue: 182.0/255.0)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Spacer()
                
                VStack {
                    
                    Text("Terms and Conditions")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 28)
                    
                    ScrollView {
                        Text(termsAndConditionsText.text)
                            .fontWeight(.medium)
                    }.padding(.horizontal)
                    
                    Button(action: {
                            self.agreed.toggle()
                    }, label: {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: self.agreed ? "checkmark.square.fill" : "square")
                            
                            Text("I have read and agree to the terms and conditions")
                                .fontWeight(.medium)
                        }.foregroundColor(Color(red: 38.0/255.0, green: 70.0/255.0, blue: 83.0/255.0))
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
                            .background(Color(red: 38.0/255.0, green: 70.0/255.0, blue: 83.0/255.0))
                            .cornerRadius(20)
                            .padding(.bottom, 30)
                            .opacity(self.agreed ? 1 : 0.5)
                            .animation(.default, value: self.agreed)
                    }).disabled(!self.agreed)
                }
                
                Spacer()
            }.background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal, 25)
            .padding(.vertical, 100)
            .shadow(radius: 8)
        }
    }
}

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsView()
    }
}
