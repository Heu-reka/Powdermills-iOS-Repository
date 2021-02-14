//
//  MapAnnotation.swift
//  Powdermills
//
//  Created by James Sadlier on 14/02/2021.
//

import Foundation
import UIKit
import Mapbox
import Combine

public protocol MapAnnotation: MGLAnnotation {
	func annotationImage() -> UIImage?
	func reuseIdentifier() -> String
	func viewForAnnotation() -> MapAnnotationView?
}

public class BuildingAnnotation: NSObject, MapAnnotation {
	public var coordinate: CLLocationCoordinate2D
	private var view: MapAnnotationView?
	private var imageView: UIImageView?
	public var building: FSBuilding
	private var buildingIcon: UIImage?
	public var iconLoadead = PassthroughSubject<Void, Never>()
	
	private static let size = CGSize(width: 124, height: 124)
	
	public init(building: FSBuilding) {
		self.building = building
		self.coordinate = CLLocationCoordinate2DMake(building.latitude, building.longitude)
	}
	
	private func downloadImage() {
		let iconPath = building.iconiOS
		guard let url = URL(string: iconPath) else {
			return
		}
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
			else {
				return
			}
			DispatchQueue.main.async() { [weak self] in
				self?.buildingIcon = image
				self?.iconLoadead.send()
			}
		}.resume()
	}
	
	public func annotationImage() -> UIImage? {
		if buildingIcon == nil {
			if let image = UIImage(named: "building_\(building.orders)_symbol") {
				buildingIcon = image
			} else {
				downloadImage()
			}
		}
		return buildingIcon
	}
	
	public func reuseIdentifier() -> String {
		return "\(building.orders)"
	}
	
	public func viewForAnnotation() -> MapAnnotationView? {
		if view == nil {
			view = MapAnnotationView(annotation: self, reuseIdentifier: self.reuseIdentifier())
		}
		view?.bounds.size = Self.size
		if imageView == nil {
			imageView = UIImageView(frame: view?.bounds ?? CGRect.zero)
			imageView?.image = annotationImage()
			imageView?.contentMode = .scaleAspectFit
			imageView?.bounds.size = Self.size
			if let icon = imageView {
				view?.addSubview(icon)
			}
		}
		return view
	}

}
