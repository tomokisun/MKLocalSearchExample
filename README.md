# MKLocalSearchExample

This is an Example application of MKLocalSearch

<img width="565" alt="image" src="https://user-images.githubusercontent.com/28350464/226065770-d2767f10-d353-43ec-8d9c-9a8984ba0dfb.png">

## MKPlacemark.fullAddress

```swift
import MapKit

extension MKPlacemark {
  var fullAddress: String {
    let components = [administrativeArea, locality, thoroughfare, subThoroughfare]
    return components.compactMap { $0 }.joined(separator: "")
  }
}
```
