    //
    //  ImageRowDetailsView.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 21/9/23.
    //

import SwiftUI

struct ImageRowDetailsView: View {
    @Binding var isShowingRowDetails:Bool
    @ObservedObject var data: DataModel
    var folder:String
        //    var allImage: [ImageView]
    let columns:[GridItem] = [
        GridItem(.flexible(),spacing: -10),
        GridItem(.flexible(),spacing: -10)
    ]
    var body: some View {
        NavigationStack {
            
            ScrollView(.vertical){
                LazyVGrid(columns: columns,spacing: 10) {
                        //                    ImageView(imageName: "001", text: "Wizarding School")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "002", text: "Caribbean Pirates")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "003", text: "Ancient Egypt")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "004", text: "Fashion Doll")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "005", text: "Warrior")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "006", text: "Vampire")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "007", text: "Warlook")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "008", text: "Humidity")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "009", text: "Ancient temple")
                        //                        .frame(width: 180,height: 200)
                        //                    ImageView(imageName: "010", text: "Modern culture")
                        //                        .frame(width: 180,height: 200)
                    ForEach(data.mockData) { imageSlider in
                        if imageSlider.folder == folder{
                                //                            ImageSliderView(beforeImageName: imageSlider.beforeImage, afterImageName: imageSlider.afterImage, title: imageSlider.style,width:175,height: 180, data: data)
                            ImageSliderView(beforeImageName: imageSlider.beforeImage , afterImageName: imageSlider.afterImage, title: imageSlider.style, width: 140, height: 150, folder: self.folder, urlString: imageSlider.url , data: data)
                            
                        }
                        
                    }
                    
                }.padding(.top,30)
                    .background(.bar)
                
                
                
            }
            .scrollIndicators(.hidden)
            
            
            
                //            .toolbar {
                //
                //                ToolbarItem(placement: .principal){
                //                    Text("Cinematic")
                //                        .font(.system(size: 20))
                //                        .fontDesign(.serif)
                //                        .fontWeight(.heavy)
                //
                //                }
            
                //                ToolbarItem(placement: .navigationBarLeading) {
                //                    Button {
                //                        isShowingRowDetails = false
                //                    }label: {
                //                        HStack{
                //                            Image(systemName: "chevron.left")
                //                                .bold()
                //                            Text("Back")
                //                                .fontDesign(.serif)
                //                                .fontWeight(.medium)
                //
                //                        }
                //
                //                    }
                //
                //                }
                //            }
            
        }
        
            //        .navigationBarBackButtonHidden(true)
        .navigationTitle("Cinematic")
        
        
        
        
        
        
    }
}

struct ImageRowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRowDetailsView(isShowingRowDetails: .constant(true), data: DataModel(), folder: "StyleGANEX")
    }
}
