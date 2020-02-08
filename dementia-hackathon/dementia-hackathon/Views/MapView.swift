import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var name: String
    var subtitle: String
    var movable: Bool
    var delta: Double

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()

        annotation.coordinate = coordinate
        annotation.title = name
        annotation.subtitle = subtitle

        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        view.addAnnotation(annotation)
        view.isUserInteractionEnabled = movable
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: clubData[0].locationCoordinate, name: clubData[0].name, subtitle: activityData[0].name, movable: true, delta: 0.002)
    }
}
