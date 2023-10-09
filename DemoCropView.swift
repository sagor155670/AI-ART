    //
    //  NetworkRepo.swift
    //  MLDemo
    //
    //  Created by Jannatul Ferdous on 3/9/23.
    //

import Foundation
import UIKit

class NetworkRepo {
    var urlString: String = ""
    init(urlString: String){
        self.urlString = urlString
        print(urlString)
    }
    
    func uploadDataToServerAndProcess(image: UIImage, model: ModelCard, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("invalid url : \(urlString)")
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let boundary = generateBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
            //guard let mediaImage = Media(withImage: image, forKey: "image") else { return }
        let json = getJsonDataFromModelClass(model: model)
        let dataBody = createDataBody(imageFile: image, jsonData: json, boundary: boundary)
        
        request.httpBody = dataBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error : \(error)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    if let error = json["Error"] {
                        completion(nil)
                        return
                    }
                    let downloadLink = json["Download link"] as! String
                    print(json["Download link"] as! String)
                    self.downloadImage(from: downloadLink){ image in
                        completion(image)
                        
                    }
                } catch {
                    completion(nil)
                    print(error)
                }
            }
        }.resume()
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error)")
                completion(nil)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func createDataBody(imageFile: UIImage, jsonData: Data, boundary: String) -> Data {
        
        var body = Data()
        
            // Append JSON Data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"json_data\"; filename=\"data.json\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
        body.append(jsonData)
        body.append("\r\n".data(using: .utf8)!)
        
            // Append Image Data
        if let imageData = imageFile.jpegData(compressionQuality: 0.8) {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpeg\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        return body
    }
    
    func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    func getJsonDataFromModelClass(model: ModelCard) -> Data {
        do {
            let jsonData: [String: Any] = [
                "model_folder": model.folder,
                "style": model.style,
            ]
            
            let wrappedData: [String: Any] = ["json_data": jsonData]
            
            print(wrappedData)
            
            let jsonEncodedData = try JSONSerialization.data(withJSONObject: wrappedData)
            return jsonEncodedData
        } catch {
            print("Error creating JSON data: \(error)")
            return Data()
        }
    }
}








    ////
    ////  DemoCropView.swift
    ////  AI ART
    ////
    ////  Created by Saiful Islam Sagor on 8/10/23.
    ////
    //
    //import SwiftUI
    //
    //struct DemoCropView: View {
    //
    //    var body: some View {
    ////       let image = UIImage(named: "04")!
    ////        let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
    ////        let croppedImage = cropImage(image: image, toRect: rect)
    ////
    ////
    ////        Image(uiImage: croppedImage!)
    ////            .resizable()
    ////            .aspectRatio(contentMode: .fit)
    //
    //        ZStack{
    //            Image("04")
    //                .resizable()
    //                .aspectRatio(contentMode: .fill)
    //                .frame(width: 300,height: 250,alignment: .top)
    //                .border(Color.blue,width: 3)
    ////                .clipped()
    //
    //
    //
    //
    //
    //        }
    //    }
    //    func cropImage(image: UIImage, toRect rect: CGRect) -> UIImage? {
    //        let cgImage = image.cgImage!
    //        let croppedCGImage = cgImage.cropping(to: rect)
    //        return croppedCGImage.flatMap{
    //            UIImage(cgImage: $0)
    //        }
    //    }
    //}
    //
    //struct DemoCropView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        DemoCropView()
    //    }
    //}
