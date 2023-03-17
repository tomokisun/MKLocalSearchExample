import MapKit

extension MKPlacemark {
  var fullAddress: String {
    let components = [administrativeArea, locality, thoroughfare, subThoroughfare]
    return components.compactMap { $0 }.joined(separator: "")
  }
}
