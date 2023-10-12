    //
    //  ModalView.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 3/10/23.
    //

import SwiftUI
import PhotosUI

struct PhotoPickerModalView: View {
    @State private var selectedImage:PhotosPickerItem? = nil
//    @State private var selectedImageData:Data? = nil
    @Binding var selectedImageData:Data?
    @State var isPresenting:Bool = false
    @Binding var isShowingPhotoPicker:Bool
//    var jsonData:JsonData
//    var urlString: String
    var body: some View {
        NavigationStack {
            
            VStack{
//                if let selectedImageData, let uiImage = UIImage(data: selectedImageData){
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                }else{
//                    Text("Select Imge to view")
//                }
                
                Button{
                    
                }label: {
                    HStack {
                        Image(systemName: "camera")
                        Text("Camera")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .fontDesign(.serif)
                        
                    }.frame(width: 350,height: 50)
                        .background(Color.white.opacity(1.2))
                        .padding(.bottom,-7)
                }
                    //                .padding(.bottom,-7)
                
                PhotosPicker(selection: $selectedImage, label: {
                        HStack {
                            Image(systemName: "photo")
                            Text("Photos")
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .fontDesign(.serif)
                            
                        }   .frame(width: 350,height: 50)
                            .background(Color.white.opacity(1.2))
                            .padding(.bottom,-7)

                })
                .onChange(of: selectedImage){ newItem in
                    Task{
                        if let data = try? await newItem?.loadTransferable(type: Data.self){
                            selectedImageData = data
//                            isPresenting = true
                            isShowingPhotoPicker = false

                        }

                    }
                }
            }.cornerRadius(12)
//                .fullScreenCover(isPresented: $isPresenting){
//                    ImageCropView(selectedImageData: $selectedImageData, isPresenting: $isPresenting, isShowingPhotoPicker: $isShowingPhotoPicker, jsonData: jsonData, urlString: urlString)
//
//                }
            
            Button{
                isShowingPhotoPicker = false
            }label: {
                Text("Cancel")
                    .fontWeight(.heavy)
                    .fontDesign(.serif)
                    .foregroundColor(.black)
                    .frame(width: 350,height: 50)
                    .background(Color.white.opacity(1.5))
                    .cornerRadius(12)
                    
                
            }
            
        }
    }
}

struct ModalView_Previews: PreviewProvider {
   
    static var previews: some View {
//        PhotoPickerModalView( isShowingPhotoPicker: .constant(true), jsonData: JsonData(folder: "", style: ""), urlString: "")
        PhotoPickerModalView(selectedImageData: .constant(nil), isShowingPhotoPicker: .constant(true))
    }
}
