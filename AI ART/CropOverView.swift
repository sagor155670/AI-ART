    //
    //  CropOverView.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 5/10/23.
    //

import SwiftUI

struct CropOverView: View {
    @Binding var isPresenting: Bool
    @Binding var isShowingPhotoPicker:Bool
    var body: some View {
//        NavigationView{
            VStack{
                Spacer(minLength: 600)
                    
//                GeometryReader {geometry in
//                    Rectangle()
//                        .strokeBorder(style: StrokeStyle(lineWidth: 2))
//                        .frame(width: geometry.size.width,height: 400,alignment: .center)
//
//
//                }.background(Color.clear)
                
                Button{
                    
                }label: {
                    Text("Generate")
                        .fontWeight(.heavy)
                        .fontDesign(.serif)
                        .foregroundColor(.white)
                        .frame(width: 250,height: 50)
                        .background(Color.blue.opacity(1.5))
                        .cornerRadius(12)
                        
                }
                Spacer(minLength: 50)
                    

            }
            
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
//                    
//                }
//            }
//            .navigationTitle("Crop Image")
//            .navigationBarTitleDisplayMode(.inline)
//        }
    }
}

struct CropOverView_Previews: PreviewProvider {
    static var previews: some View {
        CropOverView(isPresenting: .constant(true), isShowingPhotoPicker: .constant(false))
    }
}
