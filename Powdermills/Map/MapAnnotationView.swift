//
//  MapAnnotationView.swift
//  Powdermills
//
//  Created by James Sadlier on 14/02/2021.
//

import Foundation
import UIKit
import Mapbox

public class MapAnnotationView: MGLAnnotationView {
	
	public init(annotation: MapAnnotation?, reuseIdentifier: String?) {
		if let mbglAnnotation = annotation {
			super.init(annotation: mbglAnnotation, reuseIdentifier: reuseIdentifier)
		} else {
			super.init()
		}
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	public static func defaultReuseIdentifier() -> String {
		"OCAnnotationView-defaultReuseIdentifier"
	}
}
