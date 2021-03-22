//
//  MapAnnotationController.swift
//  Powdermills
//
//  Created by James Sadlier on 14/02/2021.
//

import Foundation
import Combine

/// Controller for user map annotation interaction
public class MapAnnotationController {
	
	/// Publisher for user map annotation interaction, publishes the `FSBuilding.orders` of the selected building annotation
	public var selectedAnnotation = PassthroughSubject<Int, Never>()
	
	/// sharedInstance
	public static var sharedInstance = MapAnnotationController()
	
}
