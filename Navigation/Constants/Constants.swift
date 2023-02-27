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

