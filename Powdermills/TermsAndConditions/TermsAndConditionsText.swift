//
//  TermsAndConditionsText.swift
//  Powdermills
//
//  Created by McCoy Zhu on 10/4/20.
//

import Foundation

class TermsAndConditionsText {
    var text: String
    
    init() {
        if let textPath = Bundle.main.path(forResource: "terms-and-conditions", ofType: "txt") {
            do {
                let textData = try Data(contentsOf: URL(fileURLWithPath: textPath))
                self.text = String(data: textData, encoding: .utf8)!
                return
            } catch {
                print("Error loading terms-and-conditions.txt: \(error)")
            }
        }
        text = ""
    }
}
