//
//  DownloadImageDemo.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 10/10/23.
//

import Foundation
import SwiftUI


struct DownloadView: View {
    @Binding var url:String?
//    var url:String = "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"
    var body: some View{

        VStack {
            
            AsyncImage(url: URL(string:url ?? "")){ image in
                   image
                    .resizable()
                    .scaledToFit()

            }placeholder: {
                ProgressView()
                    .controlSize(.large)
        }
            .padding(.bottom,50)
            
//            if url == nil{
//                AsyncImage(url: URL(string: "https://as2.ftcdn.net/v2/jpg/00/89/55/15/1000_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg")){ image in
//                       image
//                        .resizable()
//                        .scaledToFit()
//
//                }placeholder: {
//                    ProgressView()
//                        .controlSize(.large)
//            }
//                .padding(.bottom,50)
//            }else{
//                AsyncImage(url: URL(string:url ?? "")){ image in
//                       image
//                        .resizable()
//                        .scaledToFit()
//
//                }placeholder: {
//                    ProgressView()
//                        .controlSize(.large)
//
//            }
//                .padding(.bottom,50)
//            }

            if url != nil{
                Button{
                    downloadAndSaveImage(url: url ?? "https://as2.ftcdn.net/v2/jpg/00/89/55/15/1000_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg")
                }label: {
                    Text("Save Image")
                        .font(.headline)
                        .fontDesign(.serif)
                        .fontWeight(.heavy)
                        .padding(.horizontal,30)
                        .padding(.vertical,10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
                }
            }
            

        }
        

        

    }
    
    func downloadAndSaveImage(url: String){
        guard let URL = URL(string:url)  else { return }
        
        let task = URLSession.shared.dataTask(with: URL){ (data, response,error) in
            if let data = data , let image = UIImage(data: data){
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
        task.resume()
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
//        DownloadView(url: .constant(""))
        DownloadAndSaveView(modelName: "", selectedImageData: .constant(nil))
    }
}


struct DownloadAndSaveView: View{
    var modelName: String
    @Binding var selectedImageData:Data?
    @State private var outputImage: UIImage? = nil

    var body: some View{
        VStack {
            if let selectedImageData = selectedImageData, let uiImage = UIImage(data: selectedImageData){
                if outputImage != nil {
                    Image(uiImage: outputImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Button{
                        SaveImage(image: outputImage!)
                    }label: {
                        Text("Save Image")
                            .font(.headline)
                            .fontDesign(.serif)
                            .fontWeight(.heavy)
                            .padding(.horizontal,30)
                            .padding(.vertical,10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    ProgressView()
                        .controlSize(.large)
                    
                }
            }
        }
        .task {
            await loadData(selectedImageData: selectedImageData)
        }
    }

    func SaveImage(image:UIImage){
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }

    func loadData(selectedImageData: Data?) async {
        if let data = selectedImageData, let uiImage = UIImage(data: data) {
            await Task.detached(priority: .high) {
                let cartoonizer = Cartoonizer(modelName: modelName)
                let result = cartoonizer.inference(image: uiImage)
                DispatchQueue.main.async {
                    self.outputImage = result
                }
            }
        }
    }
}
