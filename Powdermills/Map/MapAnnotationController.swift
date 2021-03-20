//
//  MapAnnotationController.swift
//  Powdermills
//
//  Created by James Sadlier on 14/02/2021.
//

import Foundation
import Combine

public class MapAnnotationController {
	public var selectedAnnotation = PassthroughSubject<Int, Never>()
	public static var sharedInstance = MapAnnotationController()
	
	
}
