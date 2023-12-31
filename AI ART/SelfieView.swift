    //
    //  SelfieView.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 20/9/23.
    //

import SwiftUI

struct SelfieView: View {
    @ObservedObject var data: DataModel
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    @State var isIncreasing = true
//    var folders: [String] = ["StyleGANEX","VToonify_T","CartoonGan-tensorflow","DCT-Net","iNNfer"]

    var body: some View {

        NavigationStack {
            
            ScrollView(.vertical){
                
                LazyVStack{
                    
                        //                        ImageRowView(imageSet: MockImageViewData.ImageViews)
                        //                        ImageRowView(imageSet: MockImageViewData.ImageViews)
                        //                        ImageRowView(imageSet: MockImageViewData.ImageViews)
                        //                        ImageRowView(imageSet: MockImageViewData.ImageViews)
                    
                    ForEach(data.folders, id: \.self){ folder in
                        ImageRowView(data: data, folder: folder)
                    }
                    
//                    ImageRowView(data: data)
//                    ImageRowView(data: data)
//                    ImageRowView(data: data)
//                    ImageRowView(data: data)
//                    ImageRowView(data: data)
                    
                } .onReceive(timer){_ in
                    
                    if isIncreasing{
                        if data.slider >= 1.0{
                            isIncreasing = false
                        }
                        data.slider += 0.005

                    }
                    else{
                        if data.slider <= 0.0{
                            isIncreasing = true
                        }
                        data.slider -= 0.005
                    }
                }
                .onChange(of: data.slider){_ in
                    withAnimation(Animation.easeInOut(duration: 3)){
                        if isIncreasing{
                            data.isScaled = false
                        }
                        else{
                            data.isScaled = true
                        }

                    }
                }
                .padding(.top,20)
                .background(.bar)
                
                
            }

            .scrollIndicators(.hidden)
            
            
            
            
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("AI Selfies")
                            .font(.system(size: 30))
                            .fontDesign(.serif)
                            .fontWeight(.heavy)
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        }label: {
                            Text("PRO")
                                .foregroundColor(.white)
                                .fontDesign(.serif)
                                .fontWeight(.medium)
                                .frame(width: 60 , height: 30)
                                .background(.blue)
                                .cornerRadius(5)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "gearshape.fill")
                    }
                }
            
            
            
        }
//        .onReceive(timer){_ in
//
//            if isIncreasing{
//                if data.slider >= 1.0{
//                    isIncreasing = false
//                }
//                data.slider += 0.005
//
//            }
//            else{
//                if data.slider <= 0.0{
//                    isIncreasing = true
//                }
//                data.slider -= 0.005
//            }
//        }


//        .onAppear{
//            withAnimation(Animation.easeInOut(duration: 3).delay(2).repeatForever()) {
//
//                data.slider = 0.5
//                data.isScaled.toggle()
//
////                print(data.slider)
//            }
//        }

     
        
    }
}

struct SelfieView_Previews: PreviewProvider {
    static var previews: some View {
        SelfieView(data: DataModel())
    }
}




