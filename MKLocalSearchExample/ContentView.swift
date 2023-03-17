import SwiftUI

struct ContentView: View {
  @State var isPresented = false
  private static let lilDetent: PresentationDetent = .fraction(1/3)
  @State var sheetDetent: PresentationDetent = lilDetent
  
  var body: some View {
    Button("Show", action: {
      isPresented.toggle()
    })
    .sheet(isPresented: $isPresented, content: {
      NavigationView(content: {
        SearchView()
      })
      .presentationDetents([Self.lilDetent, .medium, .large], selection: $sheetDetent)
    })
    .navigationTitle("where are you?")
    .navigationBarTitleDisplayMode(.inline)
  }
}
