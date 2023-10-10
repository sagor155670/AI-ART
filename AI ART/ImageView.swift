//
//  ImageView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 20/9/23.
//

import SwiftUI

struct ImageView: View , Identifiable{
    var id = UUID()
    
    var imageName: String
    var text: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
//                .scaledToFit()
                .cornerRadius(10)
//                .frame(width: 160,height: 180)
                
            Text(text)
                .foregroundColor(.gray)
                .fontDesign(.serif)
                .fontWeight(.medium)
                .scaledToFit()
                .minimumScaleFactor(0.01)
            
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "001", text: "grayscale")
    }
}

struct MockImageViewData {
    static let ImageViews = [
        ImageView(imageName: "001", text: "Wizarding School"),
        ImageView(imageName: "002", text: "Caribbean Pirates"),
        ImageView(imageName: "003", text: "Ancient Egypt"),
        ImageView(imageName: "004", text: "Fashion Doll"),
        ImageView(imageName: "005", text: "Warrior"),
        ImageView(imageName: "006", text: "Vampire"),
        ImageView(imageName: "007", text: "Warlook"),
        ImageView(imageName: "008", text: "Humidity"),
        ImageView(imageName: "009", text: "Ancient temple"),
        ImageView(imageName: "010", text: "Modern culture"),
    ]
}
