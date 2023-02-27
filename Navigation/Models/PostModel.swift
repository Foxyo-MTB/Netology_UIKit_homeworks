//
//  PostModel.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 20.02.2023.
//

import UIKit

struct PostModel {
    
    let author: String
    let description: String
    let image: UIImage // Не понял, почему в задании image у нас типа String, я сделал его UIImage
    let likes: Int
    let views: Int
}

