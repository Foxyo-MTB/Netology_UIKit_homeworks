//
//  Constants.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

enum TabBarPictures {
    
    static let profileImage = UIImage(systemName: "person.crop.circle")
    static let feedImage = UIImage(systemName: "paperplane")
    
}

enum Images {
    
    static let profilePhoto = UIImage(named: "Cockatiel")
    
    static let logo = UIImage(named: "logo")
    
    static let parrotOne = UIImage(named: "Parrot1")
    
    static let parrotTwo = UIImage(named: "Parrot2")
    
    static let parrotThree = UIImage(named: "Parrot3")
    
    static let parrotFour = UIImage(named: "Parrot4")
    
}

enum ColorSet {
    
    static let bluePixel = UIColor(red: 0.28, green: 0.52, blue: 0.80, alpha: 1.00)
    
}

enum Fonts {
    
    static func systemFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: weight)
    }
    
}

enum Posts {
    
    static let postArray: [PostModel] = [
        PostModel(author: "Vladimir Beliakov", description: "Gray parrot.", image: Images.parrotOne!, likes: 500, views: 400),
        PostModel(author: "Vladimir Beliakov", description: "Green parrot with red beak.", image: Images.parrotTwo!, likes: 250, views: 300),
        PostModel(author: "Vladimir Beliakov", description: "Another green parrot.", image: Images.parrotThree!, likes: 245, views: 250),
        PostModel(author: "Vladimir Beliakov", description: "Yellow parrot with blue wings.", image: Images.parrotFour!, likes: 500, views: 600)
    ]
    
}

struct Source {
    
    static func makeGallery() -> [Gallery] {
        [
            .init(id: 1, imageName: "gallery01"),
            .init(id: 2, imageName: "gallery02"),
            .init(id: 3, imageName: "gallery03"),
            .init(id: 4, imageName: "gallery04"),
            .init(id: 5, imageName: "gallery05"),
            .init(id: 6, imageName: "gallery06"),
            .init(id: 7, imageName: "gallery07"),
            .init(id: 8, imageName: "gallery08"),
            .init(id: 9, imageName: "gallery09"),
            .init(id: 10, imageName: "gallery10"),
            .init(id: 11, imageName: "gallery11"),
            .init(id: 12, imageName: "gallery12"),
            .init(id: 13, imageName: "gallery13"),
            .init(id: 14, imageName: "gallery14"),
            .init(id: 15, imageName: "gallery15"),
            .init(id: 16, imageName: "gallery16"),
            .init(id: 17, imageName: "gallery17"),
            .init(id: 18, imageName: "gallery18"),
            .init(id: 19, imageName: "gallery19"),
            .init(id: 20, imageName: "gallery20")
        ]
    }

    static func randomPhotos(with count: Int) -> [Gallery] {
        return (0..<count).map { _ in makeGallery().randomElement()! }
    }
}

struct Gallery {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Gallery]
}

