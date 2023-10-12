    //
    //  ImageCropView.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 4/10/23.
    //

import SwiftUI

struct ImageCropView: View {
    @Binding var selectedImageData: Data?
    @Binding var isPresenting: Bool
    @Binding var isShowingPhotoPicker:Bool
    var jsonData: JsonData
    var urlString:String
    @State private var isActive:Bool = false
    @State private var isShowing:Bool = false
    @State var outputImageUrl:String?
    var body: some View {
        
        NavigationStack{
            
            VStack{
                Spacer()
                if let selectedImageData, let uiImage = UIImage(data: selectedImageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350,height: 300)
                    
                }else{
                    VStack{
                        Text("Select a Image First!")
                            .fontWeight(.heavy)
                            .fontDesign(.serif)
                            .foregroundColor(.red)
                            .fontWidth(.condensed)

                    }
                }
                
                Spacer()
                
                Button{
                    if let selectedImageData ,let uiImage = UIImage(data: selectedImageData){
                        print(urlString)
                            //                        isActive = true
                        if jsonData.folder == "AnimeGANv3"{
                            isShowing = true
                            
                        }else{
                            isActive = true
                            sendAPIPostRequest(json: jsonData, image: uiImage, urlString: urlString){ url in
                                outputImageUrl = url
                            }
                        }
                        
                        
                    }
                    
                    
                }label: {
                    Text("Generate")
                        .fontWeight(.heavy)
                        .fontDesign(.serif)
                        .foregroundColor(.white)
                        .frame(width: 250,height: 50)
                        .background(Color.blue.opacity(1.5))
                        .cornerRadius(12)
                    
                }
                Spacer(minLength: 5)
                
                
                
            }
            .navigationDestination(isPresented: $isActive){
                DownloadView(url: $outputImageUrl)
            }
            .navigationDestination(isPresented: $isShowing){
            let modelName = "\(jsonData.folder)_\(jsonData.style)"
                DownloadAndSaveView(modelName: modelName, selectedImageData: $selectedImageData)
            }
            
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        isPresenting = false
                        isShowingPhotoPicker = false
                    }label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .fontDesign(.serif)
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .frame(width: 20,height: 20)
                    }
                    
                }
            }
            .navigationTitle("Crop Image")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}


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













struct ImageCropView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCropView(selectedImageData: .constant(nil), isPresenting: .constant(false), isShowingPhotoPicker: .constant(false), jsonData: JsonData(folder: "", style: ""), urlString: "", outputImageUrl: "")
    }
}
