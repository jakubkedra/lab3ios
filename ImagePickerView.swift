import SwiftUI

struct ImagePickerView: View {
    @Binding var selectedImages: [ImageCategory: String]
    @ObservedObject var imageProvider: ImageProvider
    @State private var selectedCategory: ImageCategory = .flower
    @State private var randomImageName: String?

    var body: some View {
        VStack {
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(ImageCategory.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                        .tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if let randomImageName = randomImageName {
                Image(randomImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            }

            Button(action: {
                randomImageName = getRandomImageName(for: selectedCategory)
                if let randomImageName = randomImageName {
                    selectedImages[selectedCategory] = randomImageName
                }
            }) {
                Text("Randomize Image")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Pick an Image")
    }

    func getRandomImageName(for category: ImageCategory) -> String? {
        switch category {
        case .flower:
            return imageProvider.flowerImages.randomElement()
        case .animal:
            return imageProvider.animalImages.randomElement()
        case .car:
            return imageProvider.carImages.randomElement()
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    @State static var previewsSelectedImages: [ImageCategory: String] = [:]
    static var previews: some View {
        ImagePickerView(selectedImages: $previewsSelectedImages, imageProvider: ImageProvider())
    }
}

