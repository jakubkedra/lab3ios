import Foundation
import SwiftUI

class ImageProvider: ObservableObject {
    @Published var flowerImages: [String] = []
    @Published var animalImages: [String] = []
    @Published var carImages: [String] = []

    init() {
        for i in 1...6 {
            flowerImages.append("f\(i)")
            animalImages.append("a\(i)")
            carImages.append("c\(i)")
        }
    }

    func getImageNameForCategory(category: ImageCategory, andIndex index: Int) -> String? {
        switch category {
        case .flower:
            return index < flowerImages.count ? flowerImages[index] : nil
        case .animal:
            return index < animalImages.count ? animalImages[index] : nil
        case .car:
            return index < carImages.count ? carImages[index] : nil
        }
    }

    func getImageNumbersForCategories() -> [(ImageCategory, Int)] {
        return [
            (.flower, flowerImages.count),
            (.animal, animalImages.count),
            (.car, carImages.count)
        ]
    }
}
