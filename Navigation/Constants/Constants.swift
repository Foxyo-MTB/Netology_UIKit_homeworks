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
    
}

enum ColorSet {
    
    static let bluePixel = UIColor(red: 0.28, green: 0.52, blue: 0.80, alpha: 1.00)
    
}

enum Fonts {
    
    static func systemFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: weight)
    }
    
}


