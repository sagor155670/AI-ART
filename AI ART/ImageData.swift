//
//  ImageData.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 1/10/23.
//

import SwiftUI

struct Item: Identifiable {
    init(beforeImage: String, afterImage: String, title: String, width: CGFloat, height: CGFloat, folder: String, isTF: Bool, style: String) {
        self.beforeImage = beforeImage
        self.afterImage = afterImage
        self.title = title
        self.width = width
        self.height = height
        self.folder = folder
        self.isTF = isTF
        self.style = style
        self.url = isTF ? "http://103.4.146.170:8001/api/cartoonify/" : "http://103.4.146.170:8002/api/cartoonify/"
    }
    
    let id = UUID()
    let beforeImage: String
    let afterImage: String
    let title: String
    let width: CGFloat
    let height: CGFloat
    let folder: String
    let isTF: Bool
    let style: String
    let url: String
    

}

