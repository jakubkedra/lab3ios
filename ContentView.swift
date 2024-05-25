import SwiftUI

struct ContentView: View {
    @ObservedObject var imageProvider = ImageProvider()
    @State private var selectedImages: [ImageCategory: String] = [:]

    var body: some View {
        NavigationView {
            VStack {
                ForEach(ImageCategory.allCases, id: \.self) { category in
                    if let imageName = selectedImages[category] {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .padding()
                    } else {
                        Text("No image selected")
                            .frame(height: 100)
                            .padding()
                    }
                }

                NavigationLink(destination: ImagePickerView(selectedImages: $selectedImages, imageProvider: imageProvider)) {
                    Text("Pick Images")
                }
                .padding()
            }
            .navigationTitle("Random Images")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
