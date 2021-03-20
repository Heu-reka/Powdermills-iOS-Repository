import SwiftUI
import Mapbox
import Combine

extension MGLPointAnnotation {
	convenience init(title: String, coordinate: CLLocationCoordinate2D) {
		self.init()
		self.title = title
		self.coordinate = coordinate
	}
}

struct MapView: UIViewRepresentable {
	
	var viewModel: BuildingListViewModel
	private static var mapURLString = "mapbox://styles/kevinmcgarry/ckhahij881umy19n08trhee74"
	private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
	
	// MARK: - Configuring UIViewRepresentable protocol
	func makeUIView(context: UIViewRepresentableContext<MapView>) -> MGLMapView {
		mapView.delegate = context.coordinator
		mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		if let styleURL = URL(string: Self.mapURLString) {
			mapView.styleURL = styleURL
		} else {
			PMLogger.sharedInstance.mapLog.error("\("Failed to load map url", privacy: .public) \(Self.mapURLString, privacy: .private)")
		}
		mapView.showsUserLocation = true
		for building in viewModel.buildings {
			mapView.addAnnotation(BuildingAnnotation(building: building))
		}
		return mapView
	}
	
	func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
	
	}
	
	func makeCoordinator() -> MapView.Coordinator {
		Coordinator(self)
	}
	
	// MARK: - Configuring MGLMapView
	
	func styleURL(_ styleURL: URL) -> MapView {
		mapView.styleURL = styleURL
		return self
	}
	
	func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapView {
		mapView.centerCoordinate = centerCoordinate
		return self
	}
	
	func zoomLevel(_ zoomLevel: Double) -> MapView {
		mapView.zoomLevel = zoomLevel
		return self
	}
	
	// MARK: - Implementing MGLMapViewDelegate
	
	final class Coordinator: NSObject, MGLMapViewDelegate {
		var control: MapView
		
		init(_ control: MapView) {
			self.control = control
		}
		
		func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
			PMLogger.sharedInstance.mapLog.log("View Loaded")
		}
		
		func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
			if let buildingAnnotation = annotation as? BuildingAnnotation {
				let annotationView = buildingAnnotation.viewForAnnotation()
				return annotationView
			}
			return nil
		}
		
		func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
			return true
		}
		
		func mapView(_ mapView: MGLMapView, didSelect annotationView: MGLAnnotationView) {
			if let buildingAnnotation = annotationView.annotation as? BuildingAnnotation {
				MapAnnotationController.sharedInstance.selectedAnnotation.send(buildingAnnotation.building.orders)
			}
		}
	}
	
}
