//    //
//    //  ImageCropView.swift
//    //  AI ART
//    //
//    //  Created by Saiful Islam Sagor on 4/10/23.
//    //
//
//import SwiftUI
//
//struct ImageCropView: View {
//    @Binding var selectedImageData: Data?
//    @Binding var isPresenting: Bool
//    @Binding var isShowingPhotoPicker:Bool
//    var jsonData: JsonData
//    var urlString:String
//    @State private var isActive:Bool = false
//    @State private var isShowing:Bool = false
//    @State var outputImageUrl:String?
//    var body: some View {
//
//        NavigationStack{
//
//            VStack{
//                Spacer()
//                if let selectedImageData, let uiImage = UIImage(data: selectedImageData){
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 350,height: 300)
//
//                }else{
//                    VStack{
//                        Text("Select a Image First!")
//                            .fontWeight(.heavy)
//                            .fontDesign(.serif)
//                            .foregroundColor(.red)
//                            .fontWidth(.condensed)
//
//                    }
//                }
//
//                Spacer()
//
//                Button{
//                    if let selectedImageData ,let uiImage = UIImage(data: selectedImageData){
//                        print(urlString)
//                            //                        isActive = true
//                        if jsonData.folder == "AnimeGANv3"{
//                            isShowing = true
//
//                        }else{
//                            isActive = true
//                            sendAPIPostRequest(json: jsonData, image: uiImage, urlString: urlString){ url in
//                                outputImageUrl = url
//                            }
//                        }
//
//
//                    }
//
//
//                }label: {
//                    Text("Generate")
//                        .fontWeight(.heavy)
//                        .fontDesign(.serif)
//                        .foregroundColor(.white)
//                        .frame(width: 250,height: 50)
//                        .background(Color.blue.opacity(1.5))
//                        .cornerRadius(12)
//
//                }
//                Spacer(minLength: 5)
//
//
//
//            }
//            .navigationDestination(isPresented: $isActive){
//                DownloadView(url: $outputImageUrl)
//            }
//            .navigationDestination(isPresented: $isShowing){
//            let modelName = "\(jsonData.folder)_\(jsonData.style)"
//                DownloadAndSaveView(modelName: modelName, selectedImageData: $selectedImageData)
//            }
//
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading){
//                    Button{
//                        isPresenting = false
//                        isShowingPhotoPicker = false
//                    }label: {
//                        Image(systemName: "multiply")
//                            .resizable()
//                            .fontDesign(.serif)
//                            .foregroundColor(.black)
//                            .fontWeight(.medium)
//                            .frame(width: 20,height: 20)
//                    }
//
//                }
//            }
//            .navigationTitle("Crop Image")
//            .navigationBarTitleDisplayMode(.inline)
//
//        }
//    }
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//struct ImageCropView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCropView(selectedImageData: .constant(nil), isPresenting: .constant(false), isShowingPhotoPicker: .constant(false), jsonData: JsonData(folder: "", style: ""), urlString: "", outputImageUrl: "")
//    }
//}
