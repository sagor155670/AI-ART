//
//  ImageRowView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 20/9/23.
//

import SwiftUI

struct ImageRowView: View {
//    var imageSet: [ImageView]
    @ObservedObject var data: DataModel
//    var imageSliderSet: [ImageSliderView]
    var folder: String
//    var urlString: String
    var body: some View {
        VStack {
            
            SubtitleView(data: data, folder: self.folder, title: self.folder)
                
            ScrollView(.horizontal) {
                
                LazyHStack {
                    Divider()
                        .padding(8)
                    .hidden()
//                    ForEach(imageSet){ imageView in
//                        ImageView(imageName: imageView.imageName, text: imageView.text)
//                            .frame(width: 150,height: 170)
//                            .scaledToFit()
//                    }
                    
                    ForEach(data.mockData) { imageSlider in
                        if imageSlider.folder == folder {
//                            ImageSliderView( beforeImageName: imageSlider.beforeImage, afterImageName: imageSlider.afterImage, title: imageSlider.style,width:140,height: 150, data: data, folder: self.folder,urlString: imageSlider.url)
                            ImageSliderView(beforeImageName: imageSlider.beforeImage , afterImageName: imageSlider.afterImage, title: imageSlider.style, width: 140, height: 150, folder: self.folder, urlString: imageSlider.url , data: data)
//                                .onTapGesture {
//                                    print("hi")
//                                }
                        }
                        
                    }

                    Divider()
                        .padding(8)
                    .hidden()
                    
                }
                

            }
            
            
            
            .frame(height: 175)
                .scrollIndicators(.hidden)
            
        }
        
        
    }
}

struct ImageRowView_Previews: PreviewProvider {
    static var previews: some View {
//        ImageRowView(imageSet: MockImageViewData.ImageViews)
        ImageRowView(data: DataModel(), folder: "StyleGANEX")
    }
}
