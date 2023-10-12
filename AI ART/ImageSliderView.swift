    //
    //  ImageSliderView.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 25/9/23.
    //

import SwiftUI

struct JsonData: Codable{
    let folder:String
    let style: String

}

struct ImageSliderView: View,Identifiable {
    
    var id = UUID()
    var beforeImageName: String
    var afterImageName: String
    var title: String
    var width: CGFloat
    var height: CGFloat
    var folder: String
    var urlString: String
    @ObservedObject var data: DataModel
    @State var isShowingPhotoPicker:Bool = false
    @Binding var selectedImageData:Data?
    @State private var isPresentingCropView:Bool = false
    @State var outputImageUrl:String?
    @State var isShowing:Bool = false
    @State var isActive:Bool = false
        //    @State var slider: CGFloat = 1
        //    @State var isScaled :Bool = true
    
    
    
    var body: some View {
        let jsondata = JsonData(folder: self.folder, style: self.title)
        NavigationStack {
            ZStack {
                Image(afterImageName)
                    .resizable()
                    .frame(width: width, height: height)
                    .scaleEffect(data.isScaled ? 1.2 : 1.0)
                    .mask(
                        Rectangle()
                            .frame(width: width, height: height)
                    )
                
                Image(beforeImageName)
                    .resizable()
                    .frame(width: width,height: height)
                    .scaleEffect(data.isScaled ? 1.2 : 1.0)
                    .mask(
                        Rectangle()
                            .frame(width: data.slider*width + 5 ,height: height+10)
                        //                            .frame(width: data.slider*width ,height: height+10)
                            .offset(x: (1 - data.slider) * (width / 2))
                        
                    ) .overlay(
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 3,height: height)
                        //                            .offset(x:  (-data.slider * width) + (data.slider > 0.5 ? 0 : 5))
                            .offset(x:  (-data.slider * width))
                        , alignment: .trailing
                        
                    )
                    //                      .overlay(
                    //                         Rectangle()
                    //                         .stroke(Color.white, lineWidth: 4)
                    //                         .frame(width: slider*150,height: 170)
                    //                         .offset(x:  (1 - slider) * 150)
                    //
                    //                      )
                
                
            }.cornerRadius(10)
            
            
            Text(title)
                .foregroundColor(.gray)
                .fontDesign(.serif)
                .fontWeight(.medium)
                .scaledToFit()
                .minimumScaleFactor(0.01)
        }
        .navigationDestination(isPresented: $isActive){
            DownloadView(url: $outputImageUrl)
        }
        .navigationDestination(isPresented: $isShowing){
            let modelName = "\(jsondata.folder)_\(jsondata.style)"
            DownloadAndSaveView(modelName: modelName, selectedImageData: $selectedImageData)
        }
        
        
        
            //        .fullScreenCover(isPresented: $isPresentingCropView){
            //            ImageCropView(selectedImageData: $selectedImageData, isPresenting: $isPresentingCropView, isShowingPhotoPicker: .constant(false), jsonData: jsondata, urlString: urlString)
            //
            //        }
            //        .sheet(isPresented: $isShowingPhotoPicker){
            //            PhotoPickerModalView(isShowingPhotoPicker: $isShowingPhotoPicker, jsonData: jsondata, urlString: urlString)
            //                .presentationDetents([.fraction(0.25)])
            //                .presentationBackground(Color.clear)
            //                .transaction{ transaction in
            //                    transaction.animation = nil
            //                }
            //        }
        .onTapGesture {
                //            isShowingPhotoPicker.toggle()
                //            isPresentingCropView.toggle()
            if let selectedImageData ,let uiImage = UIImage(data: selectedImageData){
                print(urlString)
                    //                        isActive = true
                if jsondata.folder == "AnimeGANv3"{
                    isShowing = true
                    
                }else{
                    isActive = true
                    sendAPIPostRequest(json: jsondata, image: uiImage, urlString: urlString){ url in
                        outputImageUrl = url
                    }
                }
            }
            
            
                //         .onAppear{
                //             withAnimation(Animation.easeInOut(duration: 3).delay(2).repeatForever()) {
                //                 data.slider = 0.5
                //                 data.isScaled = true
                //             }
                //         }
            
            
        }
    }
}

//struct ImageSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageSliderView(beforeImageName: "lady",afterImageName: "DCT-Net 3d", title: "HolyLand",width: 150,height: 170, data: DataModel(),folder: "DCT-Net", urlString: "")
//    }
//}

    //struct MockImageSliderViewData {
    //    static let ImageSliderViews = [
    //     ImageSliderView(beforeImageName: "001",afterImageName: "01", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "002",afterImageName: "02", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "003",afterImageName: "03", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "004",afterImageName: "04", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "005",afterImageName: "05", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "006",afterImageName: "06", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "007",afterImageName: "07", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "008",afterImageName: "08", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "009",afterImageName: "09", title: "HolyLand",width: 150,height: 170),
    //     ImageSliderView(beforeImageName: "010",afterImageName: "10", title: "HolyLand",width: 150,height: 170)
    //
    //    ]
    //}


func sendAPIPostRequest(json: JsonData, image: UIImage ,urlString: String, completion: @escaping (String?) -> Void)  {
    
    
    print("Your image is on processing....Please wait a moment...!")
    guard let url = URL(string: urlString) else {
        print("url not found")
        return }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let boundary = "Boundary-\(NSUUID().uuidString)"
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    
    var data = Data()
    
        //    Create jsonData
    do{
        let jsonData: [String: Any] = [
            "model_folder": json.folder,
            "style": json.style,
        ]
        let wrappedData: [String: Any] = ["json_data": jsonData]
        
        print(wrappedData)
        
        let jsonEncodedData = try JSONSerialization.data(withJSONObject: wrappedData)
        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"json_data\"; filename=\"data.json\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
        data.append(jsonEncodedData)
        data.append("\r\n".data(using: .utf8)!)
    }catch{
        print("Error creating JSON data: \(error)")
    }
    
        //        //    Add JSONData
        //    let jsonData = try! JSONEncoder().encode(json)
        //    let jsonString = String(data: jsonData, encoding: .utf8)
        //    print(jsonString)
    
        //    data.append("--\(boundary)\r\n".data(using: .utf8)!)
        //    data.append("Content-Disposition: form-data; name=\"json_data\"; filename=\"data.json\"\r\n".data(using: .utf8)!)
        //    data.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
        //    data.append(jsonData)
        //    data.append("\r\n".data(using: .utf8)!)
        //    Add Image Data
    
    if let imageData = image.jpegData(compressionQuality: 0.8) {
        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpeg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        data.append(imageData)
        data.append("\r\n".data(using: .utf8)!)
    }
    
        //Ending of body
    data.append("--\(boundary)--\r\n".data(using: .utf8)!)
    
    request.httpBody = data
    
    let task = URLSession.shared.dataTask(with: request){ (data, response,error) in
        if let error = error{
            print("Error Sending Data: \(error)")
            return
        }
        if let response = response as? HTTPURLResponse {
            
            print("Response status code: \(response.statusCode)")
            if response.statusCode != 200{
                completion("https://as2.ftcdn.net/v2/jpg/00/89/55/15/1000_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg")
            }
        }
        
            //        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            //            print("Response data string:\n \(dataString)")
            //
            //        }
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                if let error = json["Error"] {
                    return
                }
                let downloadLink = json["Download link"] as! String
                
                print(json["Download link"] as! String)
                completion(downloadLink)
            } catch {
                print(error)
            }
        }
    }
    task.resume()
}
