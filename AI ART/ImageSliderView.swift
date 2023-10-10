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
        //    @State var slider: CGFloat = 1
        //    @State var isScaled :Bool = true
    
   

    var body: some View {
        let jsondata = JsonData(folder: self.folder, style: self.title)
        VStack {
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
        .sheet(isPresented: $isShowingPhotoPicker){
            PhotoPickerModalView(isShowingPhotoPicker: $isShowingPhotoPicker, jsonData: jsondata, urlString: urlString)
                .presentationDetents([.fraction(0.25)])
                .presentationBackground(Color.clear)
                .transaction{ transaction in
                    transaction.animation = nil
                }
        }
        .onTapGesture {
            isShowingPhotoPicker.toggle()
        }


            //         .onAppear{
            //             withAnimation(Animation.easeInOut(duration: 3).delay(2).repeatForever()) {
            //                 data.slider = 0.5
            //                 data.isScaled = true
            //             }
            //         }
        
        
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
