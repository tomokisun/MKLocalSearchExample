import MapKit
import SwiftUI
import CoreLocation

struct SearchView: View {
  @State var searchQuery = ""
  @State var places: [MKMapItem] = []
  @State var searchError: Error?
  
  var body: some View {
    List {
      ForEach(places, id: \.self) { place in
        VStack(alignment: .leading) {
          Text(place.name ?? "")
            .font(.headline)
            .foregroundColor(Color.primary)
          Text(place.placemark.fullAddress)
            .font(.subheadline)
            .foregroundColor(Color.secondary)
        }
      }
    }
    .listStyle(.plain)
    .navigationTitle("where are you?")
    .navigationBarTitleDisplayMode(.inline)
    .searchable(text: $searchQuery)
    .onChange(of: searchQuery) { newValue in
      search(query: newValue)
    }
  }

  func search(query: String) {
    let coordinate = CLLocationCoordinate2DMake(
      35.6598051,
      139.7036661
    )
    let region = MKCoordinateRegion(
      center: coordinate,
      latitudinalMeters: 1000.0,
      longitudinalMeters: 1000.0
    )
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = query
    request.region = region
    MKLocalSearch(request: request).start { response, error in
      if let error = error {
        print(error)
        searchError = error
      } else {
        places = response?.mapItems ?? []
      }
    }
  }
}
