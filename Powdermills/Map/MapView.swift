import SwiftUI
import Mapbox

extension MGLPointAnnotation {
	convenience init(title: String, coordinate: CLLocationCoordinate2D) {
		self.init()
		self.title = title
		self.coordinate = coordinate
	}
}

struct MapView: UIViewRepresentable {
	@Binding var annotations: [MGLPointAnnotation]
	
	var viewModel: BuildingListViewModel
	
	private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
	
	// MARK: - Configuring UIViewRepresentable protocol
	
	func makeUIView(context: UIViewRepresentableContext<MapView>) -> MGLMapView {
		mapView.delegate = context.coordinator
		mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		if let styleURL = URL(string: "mapbox://styles/kevinmcgarry/ckhahij881umy19n08trhee74") {
			mapView.styleURL = styleURL
		}
		mapView.showsUserLocation = true
		
		for building in viewModel.buildings {
			let latitude = building.latitude
			let longitude = building.longitude
			let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
			let point = MGLPointAnnotation(title: "", coordinate: coordinate)
			
		}
		
		return mapView
	}
	
	func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
		updateAnnotations()
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
	
	private func updateAnnotations() {
		if let currentAnnotations = mapView.annotations {
			mapView.removeAnnotations(currentAnnotations)
		}
		mapView.addAnnotations(annotations)
	}
	
	// MARK: - Implementing MGLMapViewDelegate
	
	final class Coordinator: NSObject, MGLMapViewDelegate {
		var control: MapView
		
		init(_ control: MapView) {
			self.control = control
		}
		
		func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
			
		}
		
		func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
			return nil
		}
		
		func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
			return true
		}
		
	}
	
}
